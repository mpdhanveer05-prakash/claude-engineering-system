# ERRORS.md — Universal Error Envelope

## Shape

```json
{
  "error": {
    "code": "user.email.already_taken",
    "message": "Email address is already in use.",
    "details": [
      { "field": "email", "issue": "duplicate" }
    ],
    "requestId": "01J5M..."
  }
}
```

## Rules
- `code` — stable, machine-readable, dotted. `<domain>.<resource>.<issue>`. Never localize.
- `message` — human-readable, safe to surface, localized server-side if applicable.
- `details` — optional array; structured info per field or sub-cause.
- `requestId` — every response (success and error) carries it; logs are correlatable.
- **Never** leak stack traces, file paths, SQL, or internal IDs.

## Code catalog

Maintain `docs/api/ERROR_CODES.md` per project with the full list. Add codes proactively:

```
auth.token.expired
auth.token.invalid
auth.mfa.required
authz.forbidden
billing.payment.declined
billing.subscription.canceled
rate_limit.exceeded
resource.not_found
resource.conflict
validation.failed
internal.unexpected
```

## Mapping
| Code class | HTTP |
|------------|------|
| `auth.*` | 401 |
| `authz.*` | 403 |
| `resource.not_found` | 404 |
| `resource.conflict` | 409 |
| `validation.*` | 422 |
| `rate_limit.*` | 429 |
| `internal.*` | 500 |
| `external.*` | 502/503/504 |
