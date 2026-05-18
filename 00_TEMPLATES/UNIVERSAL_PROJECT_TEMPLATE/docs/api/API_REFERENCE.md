# API_REFERENCE.md

> Human-readable summary of the API. Machine-readable spec at `docs/api/openapi.yaml` (REST) or `docs/api/schema.graphql` (GraphQL).

---

## Base URL

| Env | URL |
|-----|-----|
| dev | http://localhost:{PORT}/v1 |
| staging | https://api.staging.{DOMAIN}/v1 |
| prod | https://api.{DOMAIN}/v1 |

## Authentication

- Bearer JWT in `Authorization` header
- Issued by `POST /v1/auth/token`
- Lifetime: 1h access, 30d refresh

## Conventions

| Concern | Rule |
|---------|------|
| URLs | Resource-oriented, plural nouns, `kebab-case` |
| Methods | GET / POST / PATCH / DELETE — never PUT for partial update |
| Status codes | 200 OK, 201 Created, 204 No Content, 400, 401, 403, 404, 409, 422, 429, 500, 503 |
| Errors | `{ error: { code, message, details?, requestId } }` |
| Pagination | Cursor-based: `?limit=50&cursor=...`; response includes `nextCursor` |
| Filtering | Query params: `?status=active&plan=pro` |
| Sorting | `?sort=-createdAt` (prefix `-` = descending) |
| Idempotency | `Idempotency-Key` header required on POST that mutates billing or external state |
| Rate limit | `X-RateLimit-Limit`, `X-RateLimit-Remaining`, `X-RateLimit-Reset` |
| Versioning | URL prefix `/v1/`, `/v2/` |
| Deprecation | `Sunset` header + 90-day window minimum |

## Endpoints (high-level)

| Resource | Methods | Auth | Description |
|----------|---------|------|-------------|
| `/auth/token` | POST | none | Exchange creds for JWT |
| `/users` | GET, POST | admin | User CRUD |
| `/users/{id}` | GET, PATCH, DELETE | self / admin | User by ID |
| `/projects` | GET, POST | user | Project CRUD |
| `/projects/{id}` | GET, PATCH, DELETE | owner | Project by ID |
| `/webhooks/stripe` | POST | signature | Stripe events |
| `/health` | GET | none | Liveness probe |
| `/ready` | GET | none | Readiness probe |

> Detail per endpoint in `docs/api/endpoints/<resource>.md`. Generated from OpenAPI on PR merge.

## Webhooks (outbound)

| Event | Payload | Delivery |
|-------|---------|----------|
| `user.created` | `{ id, email, createdAt }` | at-least-once, exponential backoff |

## SDKs

- TypeScript: `@{org}/sdk-ts` — generated from OpenAPI
- Python: `{org}-sdk-py` — generated from OpenAPI
