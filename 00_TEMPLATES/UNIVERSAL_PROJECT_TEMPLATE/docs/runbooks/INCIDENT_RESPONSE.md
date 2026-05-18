# INCIDENT_RESPONSE.md

> What to do when something is on fire.

---

## Severity Matrix

| Severity | Definition | Response time | Escalation |
|----------|------------|---------------|------------|
| SEV1 | Customer-impacting outage of core flows | 5 min | Page on-call + lead |
| SEV2 | Degraded core flows, partial outage | 15 min | Page on-call |
| SEV3 | Non-core impacted; workaround exists | 1h | Slack on-call |
| SEV4 | Cosmetic / minor | 1 business day | Ticket |

## Roles

- **Incident Commander (IC)** — coordinates; doesn't fix
- **Operations Lead** — runs investigation + remediation
- **Communications Lead** — status page, customer comms, internal updates
- **Scribe** — timeline + key decisions

## First 10 Minutes

1. Acknowledge the page.
2. Open the incident channel (`#inc-<short-id>`).
3. Declare severity.
4. Update status page (if customer-facing).
5. Pull up dashboards: error rate, latency, throughput, infra saturation.
6. Identify last deploy (`git log --oneline -5`).
7. Decide: **rollback** vs **roll-forward**. Default rollback if last deploy <2h ago.

## During the Incident

- Status page update every 30 min for SEV1/2.
- Internal update in channel every 15 min.
- All actions in the channel — out-of-band fixes are forbidden.
- Don't speculate publicly; only confirmed facts.

## Resolution

- Confirm fix on dashboards for ≥15 min.
- Close incident channel; post resolution summary.
- Update status page.
- Schedule postmortem within 5 business days.

## Postmortem

Use `30_INCIDENT_RESPONSE/postmortem-template.md`. Blameless. Output:
- Timeline
- Root cause (5 whys)
- Contributing factors
- What went well
- What went poorly
- Action items (owner + due date)

## Common Issues

| Symptom | First check | First action |
|---------|-------------|--------------|
| 5xx spike | Recent deploy? | Rollback |
| Latency spike | DB CPU? | Check slow queries; restart connection pool |
| Auth failures | Auth provider status page | Wait + retry; fall back to cached session |
| Email not sending | SendGrid status | Switch to backup provider |
| Webhook backlog | Worker pool size | Scale workers; check for poison message |
