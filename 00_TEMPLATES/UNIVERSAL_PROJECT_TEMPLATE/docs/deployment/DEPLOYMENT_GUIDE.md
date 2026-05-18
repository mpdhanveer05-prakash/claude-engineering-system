# DEPLOYMENT_GUIDE.md

> How to deploy this project across environments. Rollback in `docs/runbooks/ROLLBACK.md`.

---

## 1. Environments

| Env | Purpose | URL | Branch / trigger |
|-----|---------|-----|------------------|
| dev | Local | localhost | `git checkout *` |
| preview | Per-PR ephemeral | `<pr#>.preview.{DOMAIN}` | PR open |
| staging | Prod-like, internal | `staging.{DOMAIN}` | merge → `main` |
| prod | Customer-facing | `{DOMAIN}` | git tag `vX.Y.Z` + manual approval |

## 2. Build & Deploy Pipeline

```
PR open  → preview deploy
PR merge → CI (lint+type+test+build+e2e) → staging deploy → smoke
Tag      → CI → manual approval → prod deploy → smoke → progressive rollout
```

Pipeline lives in `.github/workflows/`.

## 3. Pre-Deploy Checklist (every deploy)

- [ ] CI green
- [ ] Migrations reviewed (or none)
- [ ] Feature flags in correct default state
- [ ] On-call notified for prod
- [ ] Status page banner ready (if user-visible)
- [ ] Release notes drafted (`docs/releases/vX.Y.Z.md`)

## 4. Migration Strategy

- Migrations always backwards-compatible with previous code version (one release behind).
- Order: migration deploy → code deploy → cleanup deploy.
- Destructive (drop column/table): mark deprecated → release N+1 stops writing → release N+2 drops.

## 5. Rollout Strategy

| Stage | % traffic | Duration | Pass condition |
|-------|-----------|----------|----------------|
| Canary | 1% | 10 min | Error rate < baseline + 0.1% |
| Wave 1 | 10% | 30 min | Same + SLO dashboards green |
| Wave 2 | 50% | 30 min | Same |
| Full | 100% | — | Same |

Driven by feature flag or LB weight.

## 6. Rollback

See `docs/runbooks/ROLLBACK.md`. Rehearsed quarterly in staging.

## 7. Smoke Tests

Post-deploy smoke at `tests/smoke/` — runs against the just-deployed env. Must include:
- Auth happy path
- One write to DB
- One external dependency call
- Healthcheck + readiness

## 8. Secrets & Config

- Secrets: {SECRET_MANAGER}; no `.env` in CI logs
- Config: env-specific files under `config/environments/`, schema-validated at startup

## 9. Observability After Deploy

Watch for 30 min post-prod-deploy:
- Error rate (Sentry, Honeycomb)
- p95 latency (Grafana)
- Saturation (CPU, memory, queue depth)
- Business KPIs (PostHog dashboard)

## 10. Deploy Commands (cheat sheet)

```bash
# Local
{dev_command}

# Build
{build_command}

# Push image (CI does this)
{push_command}

# Deploy (CI does this; only run manually in emergencies)
{deploy_command}

# Rollback
{rollback_command}
```
