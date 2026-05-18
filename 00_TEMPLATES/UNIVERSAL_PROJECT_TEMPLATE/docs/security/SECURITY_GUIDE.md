# SECURITY_GUIDE.md

> How we keep this project safe. Threat model in `THREAT_MODEL.md`. Incident response in `docs/runbooks/INCIDENT_RESPONSE.md`.

---

## 1. Security Principles

1. **Deny by default** — every access requires explicit grant.
2. **Least privilege** — every actor, service, key has the minimum scope.
3. **Defense in depth** — assume any single layer fails.
4. **Secure by design** — security at design time, not bolt-on.
5. **No PII in logs** — redact upstream, in the logger.
6. **Secrets out of git** — vault only.
7. **Fail closed** — on auth/authz uncertainty, deny.

## 2. Identity & Auth

- Provider: {AUTH_PROVIDER}
- Protocol: OIDC
- Tokens: short-lived access (1h) + rotated refresh (30d)
- Session storage: httpOnly + Secure + SameSite=Lax cookies
- MFA: required for admins; optional for users; default-on for paid plans

## 3. Authorization

- Model: {RBAC | ABAC | ReBAC}
- Policies in `src/authz/policies/`
- Tenant isolation enforced by RLS in Postgres + middleware
- Every mutation logged with actor + target + decision

## 4. Input Validation

- Schema (Zod / Pydantic) at every API boundary
- Reject extra fields
- Strict types — no implicit coercion
- Validate file uploads: MIME + magic bytes + size cap
- Reject URLs to private networks (SSRF guard)

## 5. Output Encoding

- HTML — framework auto-escape (React, Jinja); never `dangerouslySetInnerHTML` without sanitizer
- SQL — parameterized queries only; ORM by default
- Shell — never interpolate user input; use library APIs
- LDAP/XML — proper escaping libraries

## 6. Secrets

- Storage: {AWS Secrets Manager / GCP SM / Doppler / 1Password CI}
- Rotation: 90 days for system secrets; immediately on suspected compromise
- No secrets in env files committed to git
- No secrets in logs, error messages, or analytics
- Scanner (`gitleaks`) in pre-commit + CI

## 7. Transport & Storage

- TLS 1.2+ everywhere; HSTS enabled
- DB connections via TLS
- At-rest encryption on all storage
- Field-level encryption for sensitive PII (SSN, financial)

## 8. Dependency Security

- Scanner: Dependabot + Snyk
- Critical CVEs patched in <72h
- High CVEs patched in <7d
- Lockfiles committed
- Periodic dependency review (quarterly)

## 9. Supply Chain

- CI provenance (GitHub OIDC → cloud) — no long-lived keys
- Container images from trusted bases (distroless / chainguard)
- SBOM generated per build
- Signed artifacts (cosign)

## 10. Network

- WAF at edge
- Rate limiting per IP and per user
- Bot protection on auth + signup
- Private subnets for DB and worker; no public DB access

## 11. Logging & Monitoring (Security)

- All auth events logged: login, logout, MFA, token issue/refresh, password change
- All authz failures logged with actor + resource + reason
- Logs immutable + tamper-evident (append-only sink)
- Alerts: brute-force, impossible-travel, mass-export, privilege escalation

## 12. Data Handling

- Data classification: Public / Internal / Confidential / Restricted
- Retention policy per class; documented in `docs/security/DATA_RETENTION.md`
- DSAR (data subject access request) playbook in runbooks
- Deletion is hard-delete + audit log entry

## 13. Vulnerability Disclosure

- Public `SECURITY.md` at repo root
- security@{DOMAIN} mailbox
- Acknowledgment within 48h
- Coordinated disclosure window: 90 days

## 14. Compliance

| Regime | Status | Owner | Next audit |
|--------|--------|-------|------------|
| SOC 2 Type II | | | |
| GDPR | | | |
| HIPAA | | | |
| PCI DSS | n/a (Stripe-hosted checkout) | | |

## 15. Periodic Reviews

| Cadence | Review |
|---------|--------|
| Weekly | Dependency advisories |
| Monthly | Auth/authz code paths touched |
| Quarterly | Threat model refresh |
| Annually | Pentest + DR drill |
