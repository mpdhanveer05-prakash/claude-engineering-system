# database/migrations/

Forward-only, numbered migrations.

Convention:
```
NNNN_<slug>.sql     # NNNN is zero-padded sequence (0001, 0002, ...)
```

Or with your tool's convention (Drizzle, Prisma, Alembic, golang-migrate).

Rules:
- **Never edit a migration that has been applied anywhere except local dev.** If you need to change it, write a follow-up migration.
- Each migration is **backwards-compatible** with the previous code version.
- **Destructive changes** are two-step (deprecate → ship → drop).
- Each migration tested in CI against a real Postgres instance.
- Backfills that touch many rows: run as a separate, idempotent script in `infra/scripts/`, not in the migration.
