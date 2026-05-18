# THREAT_MODEL.md

> STRIDE-based threat model. Refreshed quarterly or on architectural change.

---

## 1. System Diagram (data-flow oriented)

See `ai/context/SYSTEM_ARCHITECTURE.md` §2; trust boundaries marked.

## 2. Assets

| Asset | Confidentiality | Integrity | Availability |
|-------|-----------------|-----------|--------------|
| User credentials | Critical | Critical | High |
| PII (name, email, billing) | High | High | Medium |
| Auth tokens | Critical | Critical | High |
| Customer business data | High | Critical | High |
| Audit logs | Medium | Critical | Medium |
| Internal admin tools | High | High | Medium |

## 3. Trust Boundaries

| Boundary | From | To | Controls |
|----------|------|-----|----------|
| Internet → Edge | Browser | CDN/WAF | TLS, WAF rules, rate limit |
| Edge → API | CDN | API | mTLS or IP allowlist |
| API → DB | API | Postgres | private network, RBAC, RLS |
| API → External | API | Stripe/SendGrid | TLS, scoped API keys |

## 4. STRIDE per Container

### Web App
| Threat | Vector | Mitigation | Residual |
|--------|--------|------------|----------|
| S — Spoofing | Stolen token | Short TTL + refresh rotation + device binding | Low |
| T — Tampering | CSRF | SameSite=Lax cookies + double-submit token | Low |
| R — Repudiation | User denies action | Audit log w/ signed timestamps | Low |
| I — Info disclosure | XSS | React escape + CSP + Trusted Types | Low |
| D — DoS | Bot signup flood | Cloudflare bot mgmt + per-IP rate limit | Medium |
| E — Elevation | Privilege escalation | Authz checked at every mutation | Low |

### API
| Threat | Mitigation |
|--------|------------|
| S | JWT verify on every request; key rotation; clock skew check |
| T | Input validation (Zod); strict typing; ORM (no string SQL) |
| R | Audit log per mutation |
| I | DTOs filter outputs; no internal IDs leaked; PII redacted in logs |
| D | Rate limit per token; circuit breakers on downstream |
| E | Tenant filter in every query (middleware + RLS as belt-and-suspenders) |

### Database
| Threat | Mitigation |
|--------|------------|
| S | DB user per service, no shared superuser in app |
| T | All changes via migrations + audit triggers on sensitive tables |
| R | WAL archived to immutable storage |
| I | At-rest encryption + column-level for PII |
| D | Connection pool sized; PgBouncer; read replicas |
| E | RBAC + RLS; no SELECT * from app code |

### Worker
| Threat | Mitigation |
|--------|------------|
| S | Queue auth via signed envelopes |
| T | Job payload schema-validated; idempotent handlers |
| R | Audit per job execution |
| I | Same PII rules as API |
| D | Backpressure; dead-letter queue with alarms |
| E | Worker has only the IAM scopes it needs |

## 5. Abuse Cases

| Actor | Goal | Vector | Detection | Response |
|-------|------|--------|-----------|----------|
| Credential stuffer | Account takeover | Botnet against /login | Velocity + impossible travel | Rate limit + CAPTCHA + forced MFA |
| Spammer | Use signup to relay | Mass signup → mass email | Signup velocity + email reputation | Email verify + cooldown |
| Insider | Exfiltrate customer data | Mass export | Audit + DLP alert | Revoke access + investigate |
| Crawler | Scrape data | Polite scraping | Robots + per-token RL | 429 + block |

## 6. Open Risks (accepted / mitigated / deferred)

| ID | Risk | Status | Owner | Review date |
|----|------|--------|-------|-------------|
| R-001 | Webhook signing key reuse across envs | Accepted (short-term) | | YYYY-MM-DD |
| R-002 | No bug bounty yet | Deferred | | |

## 7. Last Reviewed

YYYY-MM-DD by {name}.
