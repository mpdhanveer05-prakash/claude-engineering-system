# Database Schema from PRD

**Goal:** Turn a PRD into a Postgres schema with migrations, indexes, and constraints.
**When to use:** New feature with persistent state.
**Inputs:** PRD content, existing schema (if any), expected scale.
**Output shape:** SQL migration file(s) + ERD + index rationale.
**Stop conditions:** No premature partitioning; no exotic types without justification.

---

Read the PRD and produce a schema.

**PRD:** {PRD_CONTENT}
**Existing schema:** {EXISTING_SCHEMA_LINK}
**Expected scale (1y / 3y):** {SCALE}

Follow `26_DATABASE_STANDARDS/SCHEMA.md` exactly. Produce:

1. **ERD** (Mermaid `erDiagram`) showing new + existing relationships.
2. **DDL migration** in `database/migrations/NNNN_<slug>.sql`:
   - Tables with universal baseline (`id`, `created_at`, `updated_at`, `deleted_at?`, `tenant_id?`)
   - Explicit FKs with named indexes
   - CHECK constraints for enum-like fields
   - JSONB only for actually-variable shapes
3. **Index plan** — for each new index, the query pattern it serves.
4. **Backfill plan** if existing rows need a default — separate idempotent script.
5. **Rollout plan** — staged for any destructive change.
6. **Open questions** for ambiguities you can't safely guess.

Reject FLOAT for money. Reject string IDs in same-DB FKs. Reject `VARCHAR(n)` outside protocol limits.
