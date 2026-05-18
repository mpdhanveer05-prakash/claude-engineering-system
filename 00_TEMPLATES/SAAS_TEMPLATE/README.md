# SAAS_TEMPLATE

> Overlay of `UNIVERSAL_PROJECT_TEMPLATE` for multi-tenant SaaS.

## Stack defaults
| Layer | Choice |
|-------|--------|
| Tenancy model | Shared DB, shared schema with `tenant_id` + RLS |
| Auth | Clerk or WorkOS (with SSO/SAML) |
| Billing | Stripe Billing + customer portal |
| Plans / entitlements | Stigg or in-house entitlement service |
| Notifications | Knock or Novu |
| Audit log | Per-tenant immutable log → S3 + searchable index |
| Admin tools | Retool / Forest Admin or custom internal app |

## Required additions to project `CLAUDE.md`

```markdown
## SaaS-specific rules
- Every query must include `tenant_id`; enforced by middleware + Postgres RLS.
- Every entitlement check goes through `lib/entitlements/`; no inline plan checks.
- Webhooks (Stripe, etc.) deduplicated by event.id and stored idempotently.
- Customer impersonation logs both impersonator + target; visible to tenant admin.
- Per-tenant feature flags supported (override defaults at tenant scope).
- Rate limits per tenant, not just per user.
- Backups verified by tenant restoration drill quarterly.
```

## Additional docs
- `docs/business/PRICING.md`
- `docs/business/ENTITLEMENTS.md`
- `docs/runbooks/TENANT_CREATION.md`
- `docs/runbooks/TENANT_DATA_EXPORT.md`
- `docs/runbooks/TENANT_DELETION.md` (GDPR)

## Folders added
```
src/billing/             # Stripe integration
src/entitlements/        # Plan → features map
src/audit/               # Audit log writer
admin/                   # Internal admin app (or link to external)
```
