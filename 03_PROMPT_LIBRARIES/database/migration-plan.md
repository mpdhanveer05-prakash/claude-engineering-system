# Migration Plan (Zero-Downtime)

**Goal:** Plan a schema change that can be deployed without downtime.
**When to use:** Any schema change touching a hot table or breaking compatibility.
**Inputs:** the change goal, table size, current write rate.
**Output shape:** Numbered rollout plan with code + migration steps interleaved.
**Stop conditions:** Never propose a single big-bang migration on a hot table.

---

Plan the migration for: {CHANGE_GOAL}

Affected table: {TABLE} ({ROW_COUNT} rows, {WRITE_RATE} writes/s)

Follow `26_DATABASE_STANDARDS/MIGRATIONS.md`. Produce a step plan:

| # | Step | Type | Backwards-compat | Risk | Verify |
|---|------|------|------------------|------|--------|

Cover, in order:
1. **Schema additions** (new column/index `CONCURRENTLY`)
2. **Code dual-write** behind a flag
3. **Backfill** (idempotent batched script)
4. **Code cutover** to read new
5. **Code stop-writing-old**
6. **Schema cleanup** (drop old) — separate release

For each step, list:
- The exact migration SQL or code change
- How to verify success
- How to roll back
- Estimated duration on prod-sized data

Mark which steps require maintenance windows (ideally: none).
