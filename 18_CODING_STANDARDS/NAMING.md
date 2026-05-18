# NAMING.md

> Names are the API. Spend effort here.

## Rules
1. **Name what it is, not what it does** for nouns; reverse for verbs.
2. **No abbreviations** unless universally understood (`url`, `http`, `id`).
3. **Boolean names are predicates**: `isActive`, `hasPermission`, `canEdit`.
4. **Plural for collections**, singular for instances. `users` is `User[]`, `user` is `User`.
5. **No type info in names** in typed languages: not `userArray`, just `users`.
6. **No Hungarian** — let the type system carry the type.
7. **Verbs match effect:** `get` is pure, `fetch` does I/O, `create` makes one, `findOrCreate` is upsert.
8. **`temp`, `data`, `info`, `manager`, `helper`, `util`** are usually a smell.
9. **Scope length to scope size.** `i` in a 3-line loop is fine; `index` across 50 lines is better.

## Per-element

| Element | Convention | Example |
|---------|-----------|---------|
| Files | `kebab-case` | `user-service.ts` |
| Folders | `kebab-case` | `use-cases/` |
| Classes / types | `PascalCase` | `OrderRepository` |
| Functions / vars | `camelCase` | `getUserById` |
| Constants | `SCREAMING_SNAKE_CASE` | `MAX_RETRIES` |
| Enums | `PascalCase` + `PascalCase` members | `OrderStatus.Pending` |
| Booleans | `is*`, `has*`, `can*`, `should*` | `isAdmin` |
| Event names | past-tense verbs | `order.created` |
| Hooks (React) | `use*` | `useOrderById` |
| Test files | `*.test.ts` / `*.spec.ts` | `user.test.ts` |

## DB

| Element | Convention | Example |
|---------|-----------|---------|
| Tables | `snake_case`, plural | `users`, `order_items` |
| Columns | `snake_case`, singular | `first_name` |
| FKs | `<table>_id` | `user_id` |
| Indexes | `idx_<table>_<cols>` | `idx_users_email` |
| Unique | `uniq_<table>_<cols>` | `uniq_users_email` |
| Junctions | `<a>_<b>` alphabetical | `roles_users` |

## URLs

- Resource-oriented, plural nouns, `kebab-case`
- `GET /api/v1/users/123/orders`
- Never verbs in URLs (`/getUser` ❌, `/users/123` ✅)
- Versioning in path: `/v1/`, `/v2/`

## Env vars

- `SCREAMING_SNAKE_CASE`
- Prefix by domain: `STRIPE_SECRET_KEY`, `AWS_REGION`
- Boolean: suffix `_ENABLED` for clarity: `MFA_ENABLED=true`

## Git branches & commits

- Branch: `<type>/<short-slug>` (`feature/billing-portal`, `fix/login-redirect`)
- Commit: `<type>(<scope>): <subject>` (`feat(billing): add proration on plan change`)
