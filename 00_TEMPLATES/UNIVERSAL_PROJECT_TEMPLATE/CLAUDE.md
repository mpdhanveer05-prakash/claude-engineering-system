# CLAUDE.md — {PROJECT_NAME}

> Project-level instructions. Overrides workspace `CLAUDE.md`. Read on every session.

---

## 1. Project Identity

| Field | Value |
|-------|-------|
| Name | {PROJECT_NAME} |
| One-liner | {ONE_LINER} |
| Stage | inception | mvp | growth | scale | mature | sunset |
| Owner | {OWNER_NAME} |
| Repo | {REPO_URL} |
| Production URL | {PROD_URL} |
| Staging URL | {STAGING_URL} |
| Started | YYYY-MM-DD |

## 2. Mission

_{One paragraph: what this project exists to do, for whom, and why now.}_

## 3. Tech Stack (resolved)

| Layer | Choice | Version | Notes |
|-------|--------|---------|-------|
| Language(s) | | | |
| Frontend framework | | | |
| Backend framework | | | |
| Database | | | |
| ORM | | | |
| Cache | | | |
| Queue / jobs | | | |
| Auth | | | |
| Hosting (frontend) | | | |
| Hosting (backend) | | | |
| CI | GitHub Actions | | |
| Observability | | | |
| Error tracking | Sentry | | |
| Analytics | | | |
| Feature flags | | | |
| Package manager | | | |

## 4. Folder Conventions

```
.claude/         # Claude config (agents, commands, hooks, settings)
ai/              # AI context, memory, prompts, sessions
docs/            # All human + AI documentation
planning/        # Features, sprints, bugs, roadmap
src/             # Source
tests/           # unit / integration / e2e / performance / security
infra/           # IaC, Docker, K8s, scripts
config/          # Env config, environment matrix
database/        # Migrations, seeds, schemas
assets/          # Static assets
analytics/       # Event taxonomy, dashboards
logs/            # Local logs (gitignored)
```

Conventions:
- One responsibility per folder. If a file fits two, pick the one most readers would search first.
- Tests live next to code (`foo.ts` + `foo.test.ts`) for unit; in `tests/` for everything else.
- Generated files go under `<area>/generated/` and are gitignored.

## 5. Coding Rules

- {PRIMARY_LANGUAGE} strict mode on
- Format on save (Prettier / Black / equivalent)
- No `any` / `dynamic` without an inline justification comment
- Functions ≤50 lines; files ≤500 lines (soft limits — split if exceeded)
- Pure functions for business logic; side effects at boundaries
- Error handling: typed errors at boundaries, never silent catches
- No console.log in committed code (use the logger)
- Comments only for non-obvious *why*, never *what*

## 6. Architecture Rules

- Define module boundaries explicitly; no cross-module imports of internals
- Public APIs of modules export from `index.ts` / `__init__.py`
- Cross-cutting concerns (logging, auth, metrics) via middleware/decorators
- New cross-cutting decisions → ADR in `docs/architecture/decisions/`
- New external dependencies → entry in `docs/THIRD_PARTY_SERVICES.md`

## 7. Naming Conventions

| What | Convention |
|------|-----------|
| Files / folders | `kebab-case` |
| TypeScript types/interfaces | `PascalCase`, no `I` prefix |
| Variables / functions | `camelCase` |
| Constants | `SCREAMING_SNAKE_CASE` |
| React components | `PascalCase`, one per file |
| DB tables | `snake_case`, plural |
| DB columns | `snake_case`, singular |
| API routes | `kebab-case`, plural resources |
| Env vars | `SCREAMING_SNAKE_CASE`, prefixed by domain (`STRIPE_`, `AWS_`) |
| Git branches | `<type>/<short-slug>` (feature/, fix/, chore/, refactor/) |

## 8. API Standards

- REST + JSON unless otherwise stated
- Resource-oriented URLs (`/users/123/orders`, not `/getUserOrders`)
- Status codes: 2xx success, 4xx client error, 5xx server error — no creative use
- Error shape: `{ error: { code, message, details?, requestId } }`
- Versioning: URL prefix `/v1/`, never undocumented breaking changes
- All endpoints: typed request + response in OpenAPI
- Idempotency keys required on POST that mutates billing or external state

## 9. Database Rules

- All schema changes through migrations — never edit existing migrations
- Migrations forward-compatible (deploy migration, deploy code, then deploy code that drops old shape)
- All tables have: `id`, `created_at`, `updated_at`, `deleted_at` (soft delete) unless justified otherwise
- Foreign keys explicit (no string IDs in the same DB)
- Indexes via migration + named explicitly
- No `SELECT *` in application code
- No raw SQL except in migrations and explicitly-justified analytical queries

## 10. Security Constraints

- Secrets via {SECRET_MANAGER} only — never `.env` in production
- Input validation at every public boundary (Zod / Pydantic / equivalent)
- Output encoding context-aware (HTML, SQL, shell)
- Authn: {AUTH_PROVIDER}; never roll your own
- Authz: {AUTHZ_MODEL} — checked at every protected operation
- PII tagged in code (`@pii` comment) — logger redacts
- Dependencies: weekly scan; high/critical patched within 7 days
- See `docs/security/THREAT_MODEL.md`

## 11. Performance Rules

- Performance budget: see `docs/performance/BUDGET.md`
- Critical paths benchmarked in CI
- DB queries: <100ms p99 for OLTP
- Web vitals: LCP <2.5s, INP <200ms, CLS <0.1 on key pages
- No N+1 queries — eager-load or batch
- Cache reads with explicit TTL and invalidation rule

## 12. UI/UX Guidelines

- Design system: `docs/design/DESIGN_SYSTEM.md`
- Component library: {COMPONENT_LIB}
- Tailwind utilities first; component-scoped CSS only when necessary
- All interactive components keyboard-accessible
- WCAG 2.2 AA minimum; verify with axe in CI
- Loading + empty + error states for every async UI
- Optimistic UI for actions <300ms; spinner otherwise

## 13. Git Workflow

- Trunk-based with short-lived feature branches
- Branch naming: `<type>/<slug>` (e.g., `feature/billing-portal`)
- Conventional commits: `<type>(<scope>): <subject>` (feat/fix/chore/refactor/docs/test/perf)
- Squash-merge into `main`
- Linear history, no merge commits
- PRs <400 LOC; if larger, split or explain
- PR description = task one-pager + screenshots/recordings for UI

## 14. Deployment Rules

- Every merge to `main` auto-deploys to staging
- Prod deploys gated by tag (`vX.Y.Z`) + manual approval
- Migrations run before code deploy; both reversible
- Feature flags default off in prod; enable progressively
- Rollback: documented, rehearsed, automated

## 15. Environment Handling

- Three envs: `dev` (local), `staging` (prod-like), `prod`
- Env config via `.env` files locally; secret manager elsewhere
- Schema-validated config at startup; fail fast on missing
- No env-specific code paths in business logic — feature-flag instead

## 16. Logging Rules

- Structured JSON logs only
- Required fields: `timestamp`, `level`, `service`, `correlation_id`, `user_id` (if known), `message`
- Levels: `error` (page), `warn` (investigate), `info` (audit), `debug` (gated)
- No PII in logs — redact upstream
- One log line per logical event, not per code path

## 17. Error Handling Standards

- Throw typed errors with context, catch at boundaries
- User-facing errors: safe message + correlation ID
- Internal errors: full stack + breadcrumbs to Sentry
- No empty `catch {}` blocks
- Retries with exponential backoff + jitter for transient failures only

## 18. Testing Requirements

- Unit: ≥80% coverage on business logic modules
- Integration: every API endpoint
- E2E: every critical user flow (signup, key action, payment)
- All bug fixes ship with a regression test
- No skipped tests in `main` — delete or fix

## 19. AI Instructions

- Before any non-trivial task: read `ai/context/AI_CONTEXT.md`, this file, and the relevant feature doc
- Use TodoWrite for tasks with >3 steps
- Use Plan mode for tasks >30 min
- Use Explore subagent for codebase scans
- After edits: run lint + types + tests before reporting done
- Update `ai/sessions/` and `ai/memory/AI_MEMORY.md` per `CLAUDE_WORKFLOW_SYSTEM.md`

## 20. Forbidden Actions

- Editing migration files after they've been applied
- Pushing to `main` directly
- Skipping pre-commit hooks
- Committing `.env`, secrets, customer data, PII
- Modifying `legacy/` without an ADR
- Calling production third-party APIs from dev/test
- Dropping tables or columns without a deprecation period
- Disabling type or test checks to "ship faster"

## 21. Safe Refactoring Rules

- Never mix behavior changes with refactors in one PR
- Always run full suite between mechanical steps
- Refactors require existing test coverage of the area; add tests first if missing
- Prefer many small commits over one large refactor commit

## 22. Dependency Management

- New dependency requires: license check, maintenance check (last commit <12mo), bundle-size check, security advisory check
- Pin versions in lockfile; renovate weekly
- Justify any dependency over 100KB minified
- Internal packages preferred over external for shared code

## 23. Documentation Rules

- Code change that affects users → release notes line
- Code change that affects API shape → API doc update in same PR
- Code change that affects schema → schema doc + migration doc
- New module → README in module folder
- New service → runbook in `docs/runbooks/`

## 24. Mobile / Web Specific Rules

_(Delete the section that doesn't apply.)_

### Web
- Server components by default; client only for interactivity
- Image optimization (Next/Image or equivalent) for all images
- Code-split per route
- Critical CSS inlined for above-the-fold

### Mobile
- Offline-first for core flows
- Battery + bandwidth budget documented per feature
- Crash-free sessions target ≥99.5% (iOS) / ≥99% (Android)
- App size budget documented

## 25. Accessibility Standards

- WCAG 2.2 AA minimum
- Keyboard navigation for every interactive element
- Screen-reader labels on icons, buttons, form controls
- Focus visible always
- Color contrast 4.5:1 text / 3:1 large text
- Reduced-motion media query respected
- Axe checks in CI; Storybook a11y addon

## 26. Scalability Principles

- Stateless services; state in the DB/cache
- Horizontal scaling first; vertical as a tactic
- Async by default for cross-service calls
- Idempotent handlers everywhere
- Budgets for memory, CPU, request rate per service
- Capacity reviewed at each release

---

*Last updated: YYYY-MM-DD by {OWNER}. Review on every minor release.*
