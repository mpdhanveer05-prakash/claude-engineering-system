# CRM_ERP_TEMPLATE

> Overlay for CRM / ERP-style apps: heavy on entities, relationships, custom fields, workflows, role-based views, reporting, imports/exports.

## Stack defaults
| Layer | Choice |
|-------|--------|
| Entity layer | Code-first entities with metadata table for custom fields |
| Workflow engine | Temporal or a state-machine DSL (XState server) |
| Reporting | Cube.dev or Metabase on a replica |
| Import/export | CSV + Excel + REST API + scheduled syncs |
| Search | Postgres FTS → Meilisearch as scale demands |
| Permissions | Field-level + row-level + record-state-level |
| Audit | Per-record change log with diff |
| Integrations | Generic webhooks + Zapier/Make connector + native (Salesforce, HubSpot, etc.) |

## Required additions
- `docs/business/ENTITIES.md` — entity catalog with owners, relationships, custom fields
- `docs/business/WORKFLOWS.md` — every state machine documented
- `docs/business/PERMISSIONS_MATRIX.md` — role × field × action
- `docs/business/REPORTS.md` — canonical report catalog
- `docs/runbooks/BULK_IMPORT.md`
- `docs/runbooks/DATA_MIGRATION.md` — for customer onboarding from legacy systems

## Project `CLAUDE.md` additions
```markdown
## CRM/ERP rules
- Custom fields live in a `custom_fields` JSONB column with metadata in `field_definitions`; never alter schema per tenant.
- Every record write hits the audit log with old + new value.
- Bulk operations have a transaction limit (default 5000 rows) and resumable on failure.
- All exports respect field-level permissions.
- Workflow transitions can never bypass authz checks.
- Reports run on a read replica, never on the primary.
- Imports validate upfront, dry-run, then apply; nothing partial.
```
