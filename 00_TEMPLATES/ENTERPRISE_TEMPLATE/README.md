# ENTERPRISE_TEMPLATE

> Overlay of `UNIVERSAL_PROJECT_TEMPLATE` for projects with enterprise-grade requirements (SSO, audit, compliance, complex authz, SLA).

## Required additions
| Concern | Requirement |
|---------|-------------|
| Auth | SAML + SCIM + OIDC; SSO mandatory; MFA enforceable per org |
| Authorization | RBAC + custom roles + delegated admin; ABAC for fine-grain |
| Data residency | Per-tenant region pinning; data export on demand |
| Compliance | SOC 2 Type II, ISO 27001, GDPR, HIPAA (as applicable) |
| Audit | Immutable, exportable, customer-readable audit trail |
| BYOK | Customer-managed keys for data encryption (KMS-backed) |
| SLA | 99.95% uptime; published status page; credit policy |
| Support | 24/7 on-call rotation; ticketing with SLA tracking |
| Procurement | Security questionnaire-ready; DPA + MSA templates |

## Additional docs
- `docs/business/MSA.md` — master service agreement template
- `docs/business/DPA.md` — data processing addendum
- `docs/security/COMPLIANCE.md` — per-regime control mapping
- `docs/security/PENETRATION_TESTS.md` — annual pentest reports (links/refs)
- `docs/security/SUB_PROCESSORS.md` — list with audit dates
- `docs/runbooks/SAML_SETUP.md` — per-IdP guides (Okta, Azure AD, etc.)
- `docs/runbooks/DATA_EXPORT.md` — tenant export procedure
- `docs/runbooks/DATA_DELETION.md` — verified deletion procedure

## Project `CLAUDE.md` additions
```markdown
## Enterprise rules
- Every customer action goes through the policy engine; no inline RBAC checks.
- Audit log is the source of truth for who did what; tamper-evident.
- Per-tenant config (auth, branding, retention) lives in a versioned config service.
- Breaking API changes require 12-month deprecation; documented in `docs/api/DEPRECATIONS.md`.
- All vendor changes (sub-processors) require customer notification per DPA.
```
