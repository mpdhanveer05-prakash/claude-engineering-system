# SLO_TEMPLATE.md

> One file per service. Lives at `docs/observability/SLOS.md` inside each project.

## Service: {SERVICE_NAME}

### SLI catalog

| ID | SLI | Definition | Source |
|----|-----|------------|--------|
| 1 | Availability | (successful_requests / total_requests) | log/metric |
| 2 | Latency | p95 of `http.request.duration_ms` | metric |
| 3 | Correctness | success of synthetic critical-path checks | synthetic |
| 4 | Freshness | max(now - last_event_processed) | metric |

### SLO targets

| SLI | Target (30d) | Window | Error budget |
|-----|--------------|--------|--------------|
| Availability | 99.9% | rolling 30d | 43m 12s |
| API p95 latency | < 300ms | rolling 30d | 5% of requests |
| Background job success | > 99% | rolling 7d | 1% |

### Burn rate alerts

| Severity | Burn rate | Window | Page? |
|----------|-----------|--------|-------|
| Fast burn | 14x | 5min/1h | yes |
| Slow burn | 6x | 30min/6h | yes |
| Notice | 3x | 2h/24h | no — ticket |

### Stakeholders
- Service owner: {NAME}
- Business owner: {NAME}
- Customers affected if breached: {WHO}

### Last reviewed
YYYY-MM-DD
