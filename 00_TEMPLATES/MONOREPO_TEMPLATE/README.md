# MONOREPO_TEMPLATE

> Overlay for monorepos. Mixes UNIVERSAL_PROJECT_TEMPLATE structure at the root with per-package structure inside `packages/` and `apps/`.

## Stack defaults
| Layer | Choice |
|-------|--------|
| Monorepo tool | Turborepo + pnpm workspaces (JS/TS) / Nx / Bazel |
| Workspace boundaries | one tsconfig per package; project references |
| Versioning | Changesets (independent or fixed) |
| CI | Turbo remote cache + selective workflows via `paths` filter |

## Repo layout
```
apps/
├── web/           # Next.js app
├── api/           # FastAPI/Hono backend
├── mobile/        # Expo app
└── admin/         # Internal tools
packages/
├── ui/            # Shared component library
├── core/          # Domain types + shared business logic
├── sdk/           # Generated/curated client SDK
├── config/        # Shared eslint, tsconfig, prettier
├── db/            # Schema + migrations (shared)
└── observability/ # Logger, tracing, metrics
docs/
ai/
planning/
infra/
```

## Project `CLAUDE.md` additions
```markdown
## Monorepo rules
- Apps depend on packages; packages NEVER depend on apps.
- Cross-package boundaries enforced via lint (`eslint-plugin-boundaries` or Nx project rules).
- One Changeset per change; PRs without one are blocked.
- Each package has its own `CLAUDE.md` covering package-local conventions.
- Each app has its own `CLAUDE.md` AND inherits root + package CLAUDE.md.
- Turbo tasks: `build`, `lint`, `typecheck`, `test`, `dev`; cache hits required for unchanged paths.
- Migrations live in `packages/db/`; apps consume via repo.
- Shared types in `packages/core/`; never duplicate.
```

## CI strategy
- `pnpm turbo run lint typecheck test build --filter=...[origin/main]` — only affected
- Remote cache via Turbo / Nx Cloud
- E2E only on affected apps + their reverse deps
