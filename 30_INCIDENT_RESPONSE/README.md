# 30_INCIDENT_RESPONSE

| File | When |
|------|------|
| `INCIDENT_PLAYBOOK.md` | Live incident handling |
| `SEVERITY_MATRIX.md` | What counts as SEV1/2/3/4 |
| `ROLES.md` | Incident Commander, Ops, Comms, Scribe |
| `POSTMORTEM_TEMPLATE.md` | Blameless postmortem |
| `STATUS_PAGE_TEMPLATES.md` | Customer comms during/after |
| `POST_INCIDENT_REVIEW.md` | Weekly review of recent incidents |
| `postmortems/` | Per-incident postmortems |

## On-call essentials
- Acknowledge in 5 minutes
- Page once = check; page twice = wake up
- All actions in the incident channel
- Postmortem within 5 business days (blameless)
- Action items have owners and dates

## Severity quick-ref

| Sev | Definition | Response time | Comms cadence |
|-----|------------|---------------|---------------|
| SEV1 | Customer-impacting outage of core flow | 5 min | every 30 min |
| SEV2 | Degraded core / partial outage | 15 min | every 60 min |
| SEV3 | Non-core impacted | 1 hr | once on close |
| SEV4 | Cosmetic / edge | 1 day | none |
