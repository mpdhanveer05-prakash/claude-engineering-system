# 27_LOGGING_STANDARDS

## Format
Structured JSON, one event per line. UTF-8.

## Required fields per log
| Field | Type | Required | Example |
|-------|------|----------|---------|
| `ts` | RFC3339 string | yes | `2026-05-18T10:00:00.123Z` |
| `level` | enum | yes | `info` |
| `service` | string | yes | `api` |
| `env` | enum | yes | `prod` |
| `correlation_id` | string | yes | `01J5M...` |
| `msg` | string | yes | `order.created` |
| `user_id` | string | when known | |
| `tenant_id` | string | when known | |
| `trace_id` | string | when traced | OTel trace ID |
| `span_id` | string | when traced | OTel span ID |
| `error.type` | string | on error | `validation_failed` |
| `error.message` | string | on error | redacted |
| `error.stack` | string | on error (dev/staging only) | |

## Levels
| Level | When |
|-------|------|
| `trace` | Verbose; off in prod |
| `debug` | Diagnostics; off in prod by default, sampled on |
| `info` | Normal lifecycle events |
| `warn` | Recoverable anomalies worth attention |
| `error` | Failed operation; investigation needed |
| `fatal` | Process must exit |

## Naming events (`msg`)
- `<resource>.<action>` past-tense: `order.created`, `auth.token.refreshed`
- Stable; treat like an API
- Document in `docs/observability/LOG_EVENTS.md`

## PII rules
- Allowed: `user_id`, `tenant_id`, `email_hash`, `ip_class` (e.g., truncated /24)
- Forbidden raw: email, name, phone, full IP, address, payment data, API keys
- Redaction happens **upstream** in the logger, not at the sink
- Test redaction: include a redaction test in your test suite

## Sampling
- Errors: 100%
- Warnings: 100%
- Info: 100% for now; reduce only with explicit cost driver
- Debug/trace: 0–10% in prod, gated by header for support

## Retention
- 30 days hot
- 1 year cold (object storage, compressed)
- Audit log: 7 years separate path

## Cross-service correlation
- Propagate `correlation_id` (and OTel trace context) across every hop
- Include in error responses to support

## Logger setup snippets
> Live in `06_BOILERPLATES/<lang>/logger.<ext>`.

| Stack | Library |
|-------|---------|
| Node | pino + pino-pretty (dev) |
| Python | structlog + JSON renderer |
| Go | zap or slog |
| Rust | tracing + tracing-subscriber |
