# PROJECT_BOOTSTRAP_CHECKLIST.md

> Walk this top-to-bottom for every new project. Skipping steps = paying later.

---

## Phase 0 — Decision (Day 0, 30 min)

- [ ] **One-line pitch** captured in `docs/product/PRODUCT_CONTEXT.md` §1
- [ ] **Top 3 users + their top 3 jobs** captured
- [ ] **Non-goals** explicitly written (what we will *not* build)
- [ ] **Success metric** picked (one quantitative North Star)
- [ ] **Build/buy/borrow** decision logged in `docs/architecture/decisions/ADR-0001-build-vs-buy.md`

## Phase 1 — Project Scaffolding (Day 0, 1h)

- [ ] Copy `00_TEMPLATES/UNIVERSAL_PROJECT_TEMPLATE` → `01_ACTIVE_PROJECTS/<slug>`
- [ ] Pick the closest specialized template (web / mobile / saas / api / ai-agent) and overlay any extras
- [ ] `git init`, first commit (`chore: scaffold from UNIVERSAL_PROJECT_TEMPLATE vX.Y`)
- [ ] Create remote (GitHub) with **branch protection on `main`** (require PR + checks)
- [ ] Set up `.gitignore` for the chosen stack
- [ ] Add `LICENSE` (default MIT for internal, choose deliberately for OSS)

## Phase 2 — AI Context Prep (Day 0, 1h)

- [ ] Fill out project `CLAUDE.md` (tech stack, conventions, forbidden actions)
- [ ] Fill out `ai/context/AI_CONTEXT.md` (project mission, stakeholders, vocab)
- [ ] Stub `ai/memory/AI_MEMORY.md` (will grow over time)
- [ ] Stub `ai/context/PRODUCT_CONTEXT.md` (target users, value prop, KPIs)
- [ ] Stub `ai/context/SYSTEM_ARCHITECTURE.md` (initial sketch — diagram + text)
- [ ] Add `ai/prompts/` with at least one project-specific prompt
- [ ] Create first session log: `ai/sessions/YYYY-MM-DD-bootstrap.md`

## Phase 3 — Requirements & Architecture (Day 1, 2–4h)

- [ ] Write PRD: `docs/product/PRD-v1.md` (template in `19_BUSINESS_REQUIREMENT_TEMPLATES/`)
- [ ] Define data model: `docs/database/DATABASE_SCHEMA.md` (ERD + text)
- [ ] Define API surface: `docs/api/API_REFERENCE.md` (OpenAPI/GraphQL SDL stubs)
- [ ] Draw C4 context + container diagrams in `docs/architecture/diagrams/`
- [ ] Pick architecture style → ADR
- [ ] Define environments matrix (dev/staging/prod) in `config/environments/`
- [ ] Identify external dependencies → `docs/THIRD_PARTY_SERVICES.md`

## Phase 4 — Environment & Tooling (Day 1, 2h)

- [ ] Pick package manager + lockfile committed
- [ ] Node/Python version pinned (`.nvmrc` / `.python-version` / `pyproject.toml`)
- [ ] Format on save: Prettier / Black / gofmt configured
- [ ] Linter: ESLint / Ruff / golangci-lint configured
- [ ] Type checker: tsc strict / mypy strict / sorbet configured
- [ ] Pre-commit hooks: lint + type + secrets scan (`gitleaks`)
- [ ] EditorConfig + `.vscode/settings.json` for shared editor config
- [ ] `.env.example` with every required env var listed (no values)

## Phase 5 — Security Baseline (Day 1–2, 2h)

- [ ] Threat model written: `docs/security/THREAT_MODEL.md` (STRIDE-lite)
- [ ] Secrets management chosen (AWS SM / GCP SM / Doppler / 1Password)
- [ ] OWASP Top 10 checklist reviewed against the design
- [ ] Auth strategy chosen + ADR
- [ ] Authz model chosen (RBAC / ABAC / ReBAC) + ADR
- [ ] Logging policy: PII redaction rules in `docs/security/LOGGING_PII_POLICY.md`
- [ ] Dependency scanner enabled (Dependabot / Renovate + Snyk)
- [ ] `SECURITY.md` at repo root with disclosure policy

## Phase 6 — Database (Day 2, 2h)

- [ ] Choose DB (default Postgres)
- [ ] Migrations tool chosen (Drizzle / Prisma / Alembic / golang-migrate)
- [ ] `database/migrations/0001_init.sql` created
- [ ] Seed data in `database/seeds/`
- [ ] Backup policy in `docs/database/BACKUP_POLICY.md`
- [ ] Read replicas / connection pooling planned (PgBouncer)
- [ ] Index conventions documented

## Phase 7 — CI/CD (Day 2, 2h)

- [ ] CI pipeline: lint + type + test + build on every PR
- [ ] Required status checks set on `main`
- [ ] Preview deploy per PR (Vercel / Fly preview / Argo)
- [ ] Staging deploy on merge to `main`
- [ ] Prod deploy gated by tag or manual approval
- [ ] Rollback runbook in `docs/runbooks/ROLLBACK.md`
- [ ] Deploy notifications wired (Slack/Discord)

## Phase 8 — Observability (Day 3, 2h)

- [ ] Logging: structured JSON + correlation IDs
- [ ] Metrics: RED (Rate/Errors/Duration) for HTTP, USE (Util/Sat/Errors) for resources
- [ ] Tracing: OpenTelemetry SDK + collector
- [ ] Error tracking: Sentry initialized
- [ ] Uptime monitoring: BetterStack / Pingdom on public endpoints
- [ ] First SLO defined in `docs/observability/SLOS.md`
- [ ] Alert routing: who gets paged for what
- [ ] First dashboard in `16_OBSERVABILITY_TEMPLATES/` or project `docs/observability/dashboards/`

## Phase 9 — Analytics (Day 3, 1h)

- [ ] Analytics tool chosen (PostHog default)
- [ ] Event taxonomy: `analytics/EVENT_TAXONOMY.md`
- [ ] First 5 events instrumented (signup, activation, key action, retention, churn)
- [ ] Consent banner if applicable (GDPR/CCPA)

## Phase 10 — Testing Strategy (Day 3, 2h)

- [ ] Unit framework chosen + first test
- [ ] Integration framework chosen + first test
- [ ] E2E framework chosen (Playwright default) + first test
- [ ] Test data factories in `tests/factories/`
- [ ] Coverage threshold set (target, not gate, unless mature)
- [ ] CI runs all three layers
- [ ] `docs/TESTING_STRATEGY.md` written

## Phase 11 — Documentation Hygiene (Day 3, 1h)

- [ ] `README.md` answers: what / why / quickstart / where docs live
- [ ] `CONTRIBUTING.md` with dev setup + commit standards
- [ ] `CHANGELOG.md` (Keep a Changelog format)
- [ ] `docs/onboarding/NEW_DEV_DAY_1.md`
- [ ] All `docs/` files have an owner listed in frontmatter

## Phase 12 — Release Engineering (Day 4, 1h)

- [ ] Versioning: SemVer for libraries, CalVer for apps (pick + document)
- [ ] Release notes template in `23_RELEASE_TEMPLATES/`
- [ ] Feature flag system wired (Unleash / Statsig / GrowthBook)
- [ ] Migration runbook template
- [ ] Customer comms template (email + in-app) for breaking changes

## Phase 13 — Backups & DR (Day 4, 1h)

- [ ] DB backups automated + tested restore
- [ ] Object storage versioning enabled
- [ ] Disaster recovery RTO/RPO documented
- [ ] Annual DR drill scheduled

## Phase 14 — Cost (Day 4, 30 min)

- [ ] Cost dashboard wired (per env)
- [ ] Budget alerts at 50/80/100% of monthly cap
- [ ] Cost owner identified

## Phase 15 — Go-Live Gate

Don't ship to prod without:

- [ ] All Phase 5 boxes checked
- [ ] All Phase 8 boxes checked
- [ ] Smoke tests passing in staging
- [ ] Rollback rehearsed once in staging
- [ ] Status page configured
- [ ] On-call rotation set

---

## Quick-Start Commands

```powershell
# 1. Scaffold
$slug = "my-new-project"
Copy-Item -Recurse "C:\Users\dhanveerp\Documents\Claude Pro Max\00_TEMPLATES\UNIVERSAL_PROJECT_TEMPLATE" `
                   "C:\Users\dhanveerp\Documents\Claude Pro Max\01_ACTIVE_PROJECTS\$slug"

# 2. Move in
Set-Location "C:\Users\dhanveerp\Documents\Claude Pro Max\01_ACTIVE_PROJECTS\$slug"

# 3. Git
git init; git add -A; git commit -m "chore: scaffold from UNIVERSAL_PROJECT_TEMPLATE"

# 4. Hand off to Claude
# Open this folder in Claude Code; first prompt:
# "Read CLAUDE.md, ai/context/AI_CONTEXT.md, then help me fill out docs/product/PRD-v1.md by interview."
```

---

*Update frequency: review quarterly. If a step is consistently skipped or always trivial, prune it. If a step is consistently bolted on later, promote it.*
