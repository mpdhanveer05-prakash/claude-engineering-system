# Feature: <Title>

| Field | Value |
|-------|-------|
| ID | FEAT-NNNN |
| Status | Idea / Spec / Build / Verify / Ship / Done |
| Owner | |
| Target release | vX.Y.Z |
| Linked PRD | `docs/product/PRD-...md` |
| Linked ADR | `docs/architecture/decisions/ADR-NNNN.md` |
| Flag | `feature.<name>` (default off) |

## Why
<1–2 sentences>

## Acceptance criteria
- [ ] ...

## Non-goals
- ...

## Design notes
- ...

## API surface
- ...

## Data model changes
- Migration: `database/migrations/NNNN_<slug>.sql`

## Telemetry
- Events: ...
- Dashboards: ...

## Test plan
- Unit: ...
- Integration: ...
- E2E: ...
- Manual: ...

## Risks
- ...

## Rollout
- ...

## Done means
- Code merged, tests green
- Docs updated (API, DB, CHANGELOG)
- Telemetry verified in staging
- Flag enabled for cohort X
