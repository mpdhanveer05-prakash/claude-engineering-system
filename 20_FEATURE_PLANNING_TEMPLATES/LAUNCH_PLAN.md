# Launch Plan — {Feature}

| Field | Value |
|-------|-------|
| Launch type | Silent / Beta / GA |
| Date | YYYY-MM-DD |
| Flag | `feature.<slug>` |
| Rollback flag flip | one-line procedure |

## Phases

| Phase | Audience | % | Duration | Pass criteria | Owner |
|-------|----------|---|----------|---------------|-------|
| Internal | Team | 100% | 3d | No SEV1/2 |  |
| Dogfood | Co | 100% | 7d | No SEV1/2 + qualitative ok |  |
| Closed beta | 10 customers | n/a | 14d | NPS ≥ baseline; opt-in retention >50% |  |
| Open beta | 5% | 5% | 7d | Error rate within +0.05% |  |
| GA Wave 1 | 25% | 25% | 7d | Same |  |
| GA Wave 2 | 50% | 50% | 7d | Same |  |
| GA Full | 100% | 100% | — | Same |  |

## Comms

| Audience | Channel | Owner | When | Template |
|----------|---------|-------|------|----------|
| Customers | Email + in-app | PM | T-7 / T-0 | `23_RELEASE_TEMPLATES/CUSTOMER_EMAIL.md` |
| Sales | Slack + enablement doc | PM | T-7 |  |
| Support | Slack + KB article | PMM | T-3 |  |
| Investors / board | Update | CEO | T+30 |  |

## KPIs to watch first 30 days

| KPI | Baseline | Target | Source |
|-----|----------|--------|--------|

## Abort conditions
- Error rate > baseline + 0.1% sustained 30 min
- p95 latency > target + 50% sustained 30 min
- ≥3 SEV2+ incidents linked to flag
- NPS drop >5 points among flagged cohort
