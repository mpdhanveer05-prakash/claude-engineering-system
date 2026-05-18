# Postmortem — INC-NNNN: <Title>

| Field | Value |
|-------|-------|
| Date of incident | YYYY-MM-DD HH:MM TZ |
| Detection time | T0 |
| Mitigation time | T0+? |
| Resolution time | T0+? |
| Severity | SEV1 / SEV2 / SEV3 |
| Customer impact | <users affected> · <% of traffic> · <duration> |
| Revenue impact | $ |
| Incident commander | |
| Operations lead | |
| Communications lead | |
| Scribe | |

> **Blameless.** Names of actions, never names of people in blame. The system failed, not a person.

## Summary
_One paragraph: what broke, what users saw, what we did, current state._

## Timeline (UTC)

| Time | Event | Source |
|------|-------|--------|
| HH:MM | Deploy v2.4.1 to prod | CI log |
| HH:MM | Error rate jumps to 12% | Grafana |
| HH:MM | Page fires | PagerDuty |
| HH:MM | IC declared, channel opened | Slack |
| HH:MM | Hypothesis 1: bad migration | hunch |
| HH:MM | Hypothesis 2 confirmed: missing index | EXPLAIN ANALYZE |
| HH:MM | Mitigation: rolled back | deploy log |
| HH:MM | Error rate returns to baseline | Grafana |
| HH:MM | Status page resolved | Statuspage |

## Root cause
_5 whys. Where did intent diverge from behavior?_

## Contributing factors
- ...
- ...

## What went well
- ...

## What went poorly
- ...

## Where we got lucky
- ...

## Action items

| # | What | Type | Owner | Due | Status |
|---|------|------|-------|-----|--------|
| 1 | Add index in `xxx` migration | prevent | | YYYY-MM-DD | open |
| 2 | Alert on query p95 per table | detect | | | open |
| 3 | Runbook for "migration but no index" | mitigate | | | open |

Types: `prevent`, `detect`, `mitigate`, `process`.

## Customer comms
- Status page link: ...
- Email sent: yes/no, audience size
- Refund / credit policy applied: yes/no

## Memory updates
- [ ] `ai/memory/gotchas.md` entry
- [ ] Runbook update
- [ ] Lint / type / test rule
