# REST.md — REST + JSON Conventions

## URL design
- Resource-oriented, plural nouns, `kebab-case`.
- Nest sparingly: `/projects/{id}/members` ok; `/projects/{id}/members/{mid}/roles` rare.
- Sub-resources only when ownership is hard; otherwise top-level resource with filter.

## HTTP methods
| Method | Use | Idempotent | Safe |
|--------|-----|------------|------|
| GET | Read | Yes | Yes |
| POST | Create or RPC-ish action | No | No |
| PATCH | Partial update | Yes (if clients send full intended-state) | No |
| PUT | Full replace | Yes | No |
| DELETE | Remove | Yes | No |

> Prefer PATCH over PUT for updates unless full-replace semantics matter.

## Status codes
| Code | Meaning |
|------|---------|
| 200 | OK with body |
| 201 | Created (return resource + Location header) |
| 202 | Accepted (async; return status URL) |
| 204 | OK, no body |
| 400 | Malformed |
| 401 | Not authenticated |
| 403 | Authenticated, not authorized |
| 404 | Not found / hidden by authz |
| 409 | Conflict (concurrent edit, duplicate) |
| 422 | Validation failed |
| 429 | Rate-limited |
| 500 | Server error (rare; should mean a bug) |
| 502/503/504 | Upstream issues |

## Request shape
- Content type: `application/json`
- Reject extra fields (Zod `.strict()`); return 422 with what was extra.
- Dates: ISO 8601 with timezone (`2026-05-18T10:00:00Z`).
- Numbers: never floats for money; use `string` if precision matters across languages.

## Response shape
- 2xx: data envelope OR raw resource (pick one and stay consistent).
- 4xx/5xx: error envelope (see `ERRORS.md`).
- Always include `id` on resources.
- Include `Location` on 201; `X-RateLimit-*` on 200/429.

## Headers
| Header | Purpose |
|--------|---------|
| `Authorization: Bearer <jwt>` | Auth |
| `Idempotency-Key: <uuid>` | Idempotent POSTs |
| `If-Match: <etag>` | Optimistic concurrency |
| `X-Correlation-ID: <uuid>` | Tracing |
| `X-RateLimit-Limit/Remaining/Reset` | Rate-limit info |
| `Sunset: <date>` | Deprecation date |

## Idempotency
- Required on POST endpoints that have **side effects** (charge, send email, create external resource).
- Server stores `{key → result}` for 24h minimum.
- Same key + same body → return cached result.
- Same key + different body → 409.

## Filtering, sorting, pagination
- Filter: `?status=active&plan=pro`
- Sort: `?sort=-createdAt,+name`
- Paginate: cursor — `?limit=50&cursor=<opaque>`; response `{ data, nextCursor }`.

## Versioning
- URL path: `/v1/`, `/v2/`.
- Add fields freely; never remove or change types without a new version.
- 90-day deprecation window minimum (longer for enterprise).
