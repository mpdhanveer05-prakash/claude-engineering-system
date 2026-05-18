# MVP_STARTUP_TEMPLATE

> Overlay for fast-moving MVPs. **Removes** ceremony the universal template assumes — meant to ship in days, not weeks.

## What's different from UNIVERSAL
| Concern | UNIVERSAL | MVP overlay |
|---------|-----------|-------------|
| ADRs | Every cross-cutting decision | Only one ADR: tech stack |
| Threat model | STRIDE per container | One page: top 5 risks |
| Test pyramid | Unit + integration + e2e + perf | Unit on logic + 3 critical e2e |
| Docs | Full set | README + CLAUDE.md + PRD + DB schema |
| Observability | OTel + traces + SLOs | Sentry + uptime monitor + logs |
| CI | Full matrix | lint + type + smoke + deploy |

## Defaults for moving fast
- One database, one deploy target, one auth provider
- Vercel + Neon + Clerk + PostHog + Sentry — five vendors, zero ops
- Feature flags via env var booleans (graduate to GrowthBook at 100 users)
- No microservices, no events, no queues until pain
- One e2e test for signup + one for payment — that's it for week 1

## When to graduate to UNIVERSAL
- First paying customer landed
- More than 1 engineer
- First incident
- First compliance ask
- First investor diligence

At that point: copy UNIVERSAL artifacts in side-by-side, fill them in, don't migrate at once.

## Project `CLAUDE.md` (MVP-specific additions)
```markdown
## MVP rules
- Bias to ship. If a feature won't kill us, ship behind a feature flag and iterate.
- Boring tech only — no rewrites, no exotic dependencies.
- Hard delete > soft delete. Soft delete adds complexity we don't need at this scale.
- Hard-code reasonable values; abstract on the third repetition.
- No premature scale work. We have <100 users.
```
