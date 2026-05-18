# 28_MONITORING_STANDARDS

## Pillars
- **Logs** — see `27_LOGGING_STANDARDS`
- **Metrics** — this doc
- **Traces** — `OBSERVABILITY_GUIDE.md` template in `UNIVERSAL_PROJECT_TEMPLATE/docs/observability/`

## Metric naming
`<domain>.<thing>.<unit>` — dotted, lowercase. Example: `http.request.duration_ms`.

Required tags on every metric:
- `service`
- `env`
- `version` (deploy SHA or tag)

## Standard service metrics
Every service exports at minimum:

| Metric | Type | Tags | Notes |
|--------|------|------|-------|
| `http.requests_total` | counter | `route`, `status` | RED |
| `http.request.duration_ms` | histogram | `route` | RED |
| `db.query.duration_ms` | histogram | `operation` | |
| `errors_total` | counter | `kind` | |
| `queue.depth` | gauge | `queue` | If applicable |
| `external.requests_total` | counter | `service`, `status` | Per dependency |
| `external.request.duration_ms` | histogram | `service` | |
| `feature_flag.evaluations_total` | counter | `flag`, `value` | If applicable |
| `business.signups_total` | counter | `plan` | Domain KPI |
| `business.revenue_total_cents` | counter | `currency` | Domain KPI |

## Cardinality
- **No high-cardinality labels** (user_id, request_id, full URL with IDs).
- Use route templates (`/users/:id`), not concrete paths.
- High-cardinality belongs in logs/traces, not metrics.

## SLOs
Every service has at least:
- Availability SLO (e.g., 99.9%)
- Latency SLO (p95 < target)
- Error-rate SLO (< 0.1%)

Define in `docs/observability/SLOS.md`. Alert on error budget burn rate (multi-window multi-burn-rate).

## Alerts
- **Page**: SLO burn 14x for 5 min
- **Ticket**: SLO burn 6x for 30 min
- **Notify**: new error class seen
- Each alert has a runbook link in the description

## Dashboards
- Service overview (RED + SLO)
- Dependency health
- Capacity (CPU, memory, conns, queue depth)
- Business KPIs

JSON exports under `docs/observability/dashboards/` so changes are reviewed.

## On-call expectations
- Acknowledge in 5 min for page
- 15 min for first action
- All actions in incident channel; nothing out-of-band
- Postmortem within 5 business days, blameless

## Status page
- Public for customer-facing systems
- Auto-update from monitoring where possible
- Manual override available
- History retained ≥1 year
