# SECURITY_REVIEW_CHECKLIST.md

> Walk before every minor release; spot-check on every PR.

## Authentication
- [ ] Strong password policy (or passwordless)
- [ ] MFA available; required for admins
- [ ] Tokens short-lived; refresh rotates
- [ ] Session fixation prevented (regenerate ID on login)
- [ ] Logout invalidates server-side state
- [ ] Brute-force throttled (per-IP and per-account)

## Authorization
- [ ] Every protected action checks authz at the handler
- [ ] No reliance on hidden UI for security
- [ ] Tenant isolation enforced server-side (RLS or middleware)
- [ ] Privilege escalation paths reviewed

## Input handling
- [ ] All inputs validated against a schema
- [ ] File uploads: type, size, magic-bytes verified
- [ ] No string-interpolated SQL / shell / LDAP
- [ ] No SSRF: outbound URLs validated against private CIDR list
- [ ] No XXE: XML parsing disabled or hardened

## Output handling
- [ ] HTML auto-escaped by framework
- [ ] No `dangerouslySetInnerHTML` / `v-html` without sanitizer
- [ ] CSP enforced (no `unsafe-inline`)
- [ ] PII redacted in logs

## Secrets
- [ ] No secrets in repo (`gitleaks` clean)
- [ ] Secrets via vault / SM only
- [ ] Rotation policy documented + automated

## Transport / storage
- [ ] HTTPS everywhere; HSTS preload
- [ ] Cookies: Secure, HttpOnly, SameSite
- [ ] DB at-rest encryption on
- [ ] Backups encrypted

## Dependencies
- [ ] Dependabot / Renovate enabled
- [ ] No critical CVEs older than 7 days
- [ ] License audit clean
- [ ] Lockfile up to date

## Headers
- [ ] CSP
- [ ] Strict-Transport-Security
- [ ] X-Content-Type-Options: nosniff
- [ ] Referrer-Policy: strict-origin-when-cross-origin
- [ ] Permissions-Policy minimal

## Auth flows
- [ ] OAuth: PKCE on
- [ ] OAuth: state param validated
- [ ] Magic-link: single-use, time-limited
- [ ] Password reset: token single-use, time-limited, rate-limited

## Webhooks
- [ ] Inbound: signed + timestamp + replay window
- [ ] Outbound: signed; receivers can verify

## Auditing
- [ ] Sensitive actions logged
- [ ] Logs tamper-evident
- [ ] Retention meets compliance

## Operational
- [ ] Status page exists
- [ ] Incident playbook tested in last 12 months
- [ ] On-call rotation set
- [ ] Backups tested via restore in last 90 days
