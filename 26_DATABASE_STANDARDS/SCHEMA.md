# SCHEMA.md — Database Schema Design Rules

## Universal table baseline
Every table:
- `id UUID PRIMARY KEY DEFAULT gen_random_uuid()` (or UUIDv7 if available)
- `created_at TIMESTAMPTZ NOT NULL DEFAULT now()`
- `updated_at TIMESTAMPTZ NOT NULL DEFAULT now()` (trigger keeps it fresh)
- `deleted_at TIMESTAMPTZ` (nullable) — unless table is append-only

## Naming
- `snake_case`
- Plural table names (`users`, not `user`)
- FK: `<table_singular>_id` → `users.id`
- Junction tables: alphabetical (`roles_users`, not `users_roles`)

## Types
| Concept | Type |
|---------|------|
| ID | UUID |
| Money | BIGINT (cents) — never FLOAT |
| Time | TIMESTAMPTZ (always UTC) |
| Enum-like | TEXT + CHECK constraint (Postgres ENUM type is rigid) |
| JSON | JSONB |
| String | TEXT (no VARCHAR(n) unless protocol limit) |
| Bool | BOOLEAN |
| Email | CITEXT |
| URL | TEXT + CHECK length |

## Constraints
- All FKs explicit and `ON DELETE` chosen deliberately (`CASCADE`, `SET NULL`, `RESTRICT`).
- All FKs indexed.
- Use CHECK constraints freely for data integrity.
- UNIQUE constraints named: `uniq_<table>_<cols>`.
- NOT NULL by default; nullable is the exception.

## Tenancy
- Every tenant-owned table has `tenant_id UUID NOT NULL REFERENCES tenants(id)`.
- Compound indexes start with `tenant_id`.
- Enable RLS on every tenant table; policies in `database/policies/`.
- Cross-tenant queries forbidden except in explicitly marked admin paths.

## Soft delete
- `deleted_at` nullable; queries default to `WHERE deleted_at IS NULL`.
- Provide an ORM scope / view that filters automatically.
- Hard delete only for: GDPR erasure, test data, mistakes <1 hour old.

## JSON columns
- Use sparingly — for actually-variable shape only.
- Define and document the shape in `docs/database/JSON_SCHEMAS/`.
- Validate via CHECK with `jsonb_typeof` or app-level Zod/Pydantic.
- Index with GIN if queried.

## Audit
- Use `audit_log` table for mutations on sensitive entities (users, billing, permissions, exports).
- Fields: `id, actor_id, target_type, target_id, action, before_jsonb, after_jsonb, ip, ua, at`.
- Write via trigger or transactional outbox — never optional in app code.

## Performance
- No table without an index on its FKs.
- Composite indexes for the actual filter combinations.
- Use partial indexes for sparse predicates (`WHERE status = 'active'`).
- BRIN for huge time-series.
- Materialized views for expensive aggregates — refreshed on a schedule.

## Versioning
- Schema = code; lives next to app, evolves with migrations.
- Tag schema version in CI: `pg_dump --schema-only` snapshot per release for drift detection.
