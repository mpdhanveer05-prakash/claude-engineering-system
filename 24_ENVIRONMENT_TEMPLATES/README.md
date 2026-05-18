# 24_ENVIRONMENT_TEMPLATES

| File | Scope |
|------|-------|
| `ENVIRONMENT_MATRIX.md` | dev / preview / staging / prod matrix |
| `.env.example` | Universal env-var skeleton |
| `config.schema.json` | JSON Schema for env config validation |
| `SECRETS_POLICY.md` | Where each kind of secret lives |
| `BRANCH_DEPLOY_MAP.md` | Which branch deploys to which env |

## Universal env matrix

| Concern | dev | preview | staging | prod |
|---------|-----|---------|---------|------|
| Purpose | local hack | per-PR preview | prod-like, internal | customer-facing |
| Data | seeded | seeded | masked prod snapshot | live |
| Auth provider | dev tenant | dev tenant | staging tenant | prod tenant |
| Billing | Stripe test | Stripe test | Stripe test | Stripe live |
| Email | Mailhog | console | Mailtrap | Real provider |
| Feature flags | all on (or env) | per-PR | matches prod | progressive |
| Observability | local | shared | full stack | full stack |
| SLAs | none | none | best-effort | per docs |

## Rules
- **No prod data** in non-prod envs except masked snapshots.
- **No prod credentials** anywhere except prod systems.
- **Schema-validated** config at startup; fail fast on missing.
- **Per-env Stripe keys**, vendor sandboxes for non-prod.
