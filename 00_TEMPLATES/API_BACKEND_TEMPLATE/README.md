# API_BACKEND_TEMPLATE

> Overlay of `UNIVERSAL_PROJECT_TEMPLATE` for headless API / backend services.

## Stack defaults
| Layer | Choice |
|-------|--------|
| Framework | FastAPI (Python) or Hono / Nest (Node) |
| Schema | OpenAPI 3.1 generated from code |
| Runtime contract | Pydantic / Zod |
| ORM | SQLAlchemy 2.0 / Drizzle |
| Workers | Celery + Redis / BullMQ |
| Long-running workflows | Temporal |
| Search | Postgres FTS → Meilisearch |
| Caching | Redis + Cache-Control headers |
| Container | Distroless multi-stage |
| Deploy | Fly.io / Cloud Run / AWS ECS |

## Required additions to project `CLAUDE.md`

```markdown
## API-specific rules
- API is contract-first: OpenAPI spec is generated from code and reviewed in PRs.
- Every endpoint validated request and response; reject extra fields.
- Idempotency keys required on POST endpoints that have side effects.
- All errors follow the project's error envelope; never leak internals.
- Pagination: cursor-based; never offset for user-facing lists.
- Rate limits documented per endpoint in `docs/api/RATE_LIMITS.md`.
- SDKs generated from OpenAPI; never hand-written.
- Webhooks signed (HMAC); receivers must verify.
- All long-running operations return 202 + status URL, not blocking.
- Background jobs idempotent; failures retried with exponential backoff + dead-letter queue.
```

## Folders added
```
src/
├── routes/              # Route handlers (thin)
├── use_cases/           # Business logic (pure)
├── repositories/        # Data access
├── domain/              # Entities, value objects
├── workers/             # Background jobs
├── middleware/
└── clients/             # External API clients
```
