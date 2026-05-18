# OBSERVABILITY_GUIDE.md

> How we know what's happening in production. Three pillars: logs, metrics, traces.

---

## 1. Logs

- Format: structured JSON, one event per line
- Required fields: `timestamp`, `level`, `service`, `env`, `correlation_id`, `user_id?`, `tenant_id?`, `message`
- Levels: `debug` (off in prod), `info`, `warn`, `error`, `fatal`
- Sink: stdout → vector → Loki / Datadog / CloudWatch
- Retention: 30d hot, 1y cold
- PII redacted at logger via central serializer

### Logger usage
```ts
log.info({ orderId, userId }, "order.created");      // good
log.info(`order created for ${userId}`);             // bad — unstructured
```

## 2. Metrics

- Library: OpenTelemetry metrics SDK
- Naming: `{domain}.{thing}.{unit}` (e.g., `http.request.duration_ms`)
- Required tags: `service`, `env`, `route`, `status`
- Dashboards in `docs/observability/dashboards/` (JSON exports)

### Standard metrics every service exports
- `http.requests_total{route,status}`
- `http.request.duration_ms{route}` (histogram)
- `db.query.duration_ms{operation}` (histogram)
- `queue.depth{queue}`
- `errors_total{kind}`

## 3. Traces

- OpenTelemetry SDK with W3C trace context propagation
- Sampling: 100% errors, 10% baseline, 100% in staging
- Critical spans: HTTP handler, DB query, external HTTP, queue publish/consume
- Trace IDs embedded in log lines and surfaced in user-facing errors

## 4. SLOs

Defined per service in `docs/observability/SLOS.md`. Standard set:

| SLI | SLO (30d) | Window |
|-----|-----------|--------|
| Availability | 99.9% | rolling |
| API p95 latency | < 300ms | rolling |
| Error rate | < 0.1% | rolling |
| Job success rate | > 99% | rolling |

Error budget alerts at 50% and 80% burned.

## 5. Alerts

| Alert | Trigger | Routes to |
|-------|---------|-----------|
| Page | SLO burn rate > 14x for 5min | on-call (PagerDuty) |
| Ticket | SLO burn rate > 6x for 30min | team Slack |
| Notify | New error type seen 5x | Sentry channel |

Alert rules in `docs/observability/alerts/`.

## 6. Dashboards

Every service has:
1. **Service overview** — RED metrics, SLO status, error rate
2. **Dependency** — downstream call success + latency
3. **Capacity** — CPU, mem, conns, queue depth
4. **Business** — domain KPIs (signups, conversions, churn)

## 7. Correlation IDs

- Generated at edge or accepted from `x-correlation-id` header
- Propagated to all downstream calls (HTTP header, queue message, log line)
- Returned in error responses for support

## 8. Cost

- Sampling tuned to stay inside per-month budget
- Cardinality watch: no high-cardinality tags (user_id) on metrics — use logs/traces

## 9. Auditing

Sensitive operations logged with: actor, target, action, decision, evidence. Audit log goes to a separate immutable sink with longer retention.
