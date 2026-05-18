# MASTER_AI_CONTEXT.md

> Persistent, global context Claude should assume across every session in this workspace. **Update this file whenever your role, stack defaults, or preferences change.**

---

## 1. Operator Profile

| Field | Value |
|-------|-------|
| Name | _(set me)_ |
| Email | mpdhanveer05@gmail.com |
| Primary role | _(e.g., Founding Engineer, Tech Lead, Solo Founder)_ |
| Years of experience | _(set me)_ |
| Strongest stacks | _(e.g., TypeScript/Next.js, Python/FastAPI, AWS)_ |
| Learning stacks | _(e.g., Rust, Flutter)_ |
| Industry / domain | _(e.g., fintech, healthtech, B2B SaaS)_ |
| Preferred IDE | VS Code + Claude Code extension |
| OS | Windows 11 (PowerShell primary, Bash secondary) |
| Timezone | _(set me)_ |

## 2. Default Tech Stack Preferences

Override per-project in the project `CLAUDE.md`.

| Layer | Default |
|-------|---------|
| Frontend (web) | Next.js 15 (App Router) + TypeScript + Tailwind + shadcn/ui |
| Frontend (mobile) | React Native (Expo) or Flutter |
| Backend (API) | FastAPI (Python) or Hono/Express (Node) |
| Backend (long-running jobs) | Temporal / BullMQ |
| DB (OLTP) | PostgreSQL via Drizzle/Prisma/SQLAlchemy |
| DB (cache/queue) | Redis |
| DB (search) | Postgres FTS → Meilisearch → OpenSearch as scale demands |
| Auth | Clerk / Auth.js / Supabase Auth |
| AI SDK | Anthropic SDK (Claude Opus/Sonnet) with prompt caching always on |
| Infra-as-code | Terraform (workspace per env) |
| Hosting | Vercel (frontend) + Fly.io / AWS ECS / Cloud Run (backend) |
| Observability | OpenTelemetry → Grafana Cloud / Honeycomb / Datadog |
| Error tracking | Sentry |
| Analytics | PostHog |
| CI | GitHub Actions |
| Package manager (JS) | pnpm |
| Package manager (Python) | uv |

## 3. Standing Preferences

- **Type safety everywhere.** TS strict, Python with mypy strict, Pydantic at boundaries.
- **Functional core, imperative shell.** Pure logic in modules, side effects at edges.
- **Server components by default** (Next.js); client components only for interactivity.
- **Tailwind utilities, not custom CSS** unless component-scoped.
- **One file per export** for components and routes.
- **Co-located tests** (`foo.ts` + `foo.test.ts`) for unit; separate folder for e2e.
- **Conventional commits** + **squash merge** + **linear history**.
- **PRs <400 LOC** when humanly possible.
- **Feature flags** for anything user-visible and reversible.
- **`docs/architecture/decisions/` ADRs** for any cross-cutting decision.

## 4. AI Collaboration Preferences

- Use **Plan mode / Plan subagent** before any task >30 min of work.
- Use **Explore subagent** when scanning >3 candidate files.
- **Always run lint + types + tests** after edits, before reporting "done."
- **No emojis** in code, commits, or docs unless explicitly asked.
- **No marketing language** in docs ("powerful," "seamless," "robust").
- **No filler** in chat — every sentence earns its keep.
- **Prefer tables** to bulleted comparisons.
- **Ask before scope creep.** If a fix reveals a deeper problem, name it, don't fix it silently.

## 5. Cross-Project Domain Knowledge

> Add bullets here for facts that apply across multiple projects (e.g., compliance regimes, vendor accounts, shared infra).

- _(example) All projects target SOC 2 + GDPR readiness from day one._
- _(example) Stripe is the default billing rail._
- _(example) Postgres is hosted on Neon for dev/staging, RDS for prod._

## 6. Vendor Accounts in Use

| Vendor | Plan | Scope | Notes |
|--------|------|-------|-------|
| _(set me)_ | _(set me)_ | _(set me)_ | _(set me)_ |

> Never log secrets here. Just account names and what they're used for.

## 7. Known Anti-Patterns (Operator-Specific)

> Personal "do not do this" list — populate over time as patterns emerge.

- _(example) Don't suggest MongoDB; we've been burned twice on schema drift._
- _(example) Don't suggest microservices for <10-person teams._

## 8. Active Long-Running Initiatives

> Cross-project initiatives Claude should be aware of.

| Initiative | Status | Why it matters |
|------------|--------|----------------|
| _(set me)_ | _(set me)_ | _(set me)_ |

## 9. Reading Priority When Context Is Tight

If Claude must drop context to fit a task, drop in this order (last = drop first):

1. Keep: current file + `CLAUDE.md` (project) + `AI_MEMORY.md`
2. Keep: `SYSTEM_ARCHITECTURE.md` for technical tasks
3. Keep: `PRODUCT_CONTEXT.md` for product tasks
4. Drop: historical session logs
5. Drop: archived decisions
6. Drop: this file (everything here should already be reflected in project files)

---

*Update frequency: monthly, or whenever your stack/role meaningfully shifts.*
