# MIGRATIONS.md — Migration Workflow & Safety

## Golden rules
1. **Forward only.** No down-migrations executed in prod (write them for local dev convenience if your tool requires).
2. **Backwards compatible** with the previous code version (= one release behind).
3. **Two steps for destructive changes** (drop column/table): deprecate → wait one release → drop.
4. **Big backfills are scripts, not migrations.** Migrations should be schema-only and fast.
5. **No migrations on hot tables without an online strategy** (e.g., `CREATE INDEX CONCURRENTLY`).

## File naming
```
NNNN_<short_slug>.sql   # NNNN = monotonic, zero-padded
```
Or tool-native (Drizzle, Prisma, Alembic, golang-migrate).

## Review checklist for every migration PR
- [ ] Is it backwards-compatible with the currently-deployed code? If not, what's the rollout plan?
- [ ] Is it safe under writes? (Locks? Long transactions? `ALTER TABLE` rewrites?)
- [ ] Does it include the matching index?
- [ ] Has it been run against a staging DB with prod-shaped data?
- [ ] Is the backfill idempotent and resumable?
- [ ] Is there a rollback plan? (Even if forward-only — what undoes the change?)

## Risky operations + the safe pattern
| Risky | Safe pattern |
|-------|--------------|
| `ALTER TABLE x ADD COLUMN c NOT NULL DEFAULT y` on big table | Add nullable → backfill → set NOT NULL |
| `CREATE INDEX` on hot table | `CREATE INDEX CONCURRENTLY` |
| `DROP COLUMN` | Step 1: stop using it in app + ship. Step 2: drop. |
| Rename column | Add new + dual-write + read from new + drop old (4 steps) |
| Change column type | New column + backfill + cutover + drop old |
| Add NOT NULL FK to non-empty table | Add nullable FK → backfill → set NOT NULL |

## Postgres-specific
- Wrap each migration in a transaction unless you can't (e.g., `CREATE INDEX CONCURRENTLY` can't be in one).
- Set `lock_timeout = '5s'` and `statement_timeout = '10min'` at the top of risky migrations to avoid taking the system down.
- Be aware of full-table rewrites: any `ALTER COLUMN` that changes representation rewrites the table.

## Backfills
- Run as a separate, idempotent script in `infra/scripts/`.
- Process in batches (e.g., 1k rows at a time).
- Resume from a checkpoint.
- Run during low-traffic windows or with a throttle.
- Log progress + emit metrics.

## CI
- Migrations run against a real Postgres in CI for every PR.
- Re-run is idempotent (apply, rollback, apply again — should succeed twice).
- Diff `pg_dump --schema-only` against a baseline; flag drift.
