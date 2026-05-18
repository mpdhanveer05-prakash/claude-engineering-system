# 06_BOILERPLATES

Runnable starter code per stack. Stuff that's universal across projects: logger, config loader, error class, request context, healthcheck.

| Folder | Stack |
|--------|-------|
| `nextjs/` | Next.js 15 + TypeScript + Tailwind + shadcn |
| `fastapi/` | FastAPI + SQLAlchemy + uv + structlog |
| `express/` | Hono / Express + pino + zod |
| `react-native/` | Expo + TypeScript + MMKV |
| `flutter/` | Flutter + Riverpod + Hive |

## When to use
- New project — overlay onto `UNIVERSAL_PROJECT_TEMPLATE`
- Reference — pattern for logger / config / error you can copy into existing code

## Required minimum per stack
1. **Config loader** — env → schema-validated typed object
2. **Logger** — structured JSON, correlation ID propagated
3. **Error class hierarchy** — typed, serializable
4. **Healthcheck + readiness endpoints**
5. **Request context middleware** — correlation ID + actor
6. **Test factories** for the common domain primitives
