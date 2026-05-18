# WORKSPACE_INDEX.md

> Single-page map of the AI engineering operating system. If you read only one file in the workspace, read [README.md](README.md) first, then this. Together they orient any new Claude session in <2 minutes.

---

## Root anchor files

| File | Lifecycle | Purpose |
|------|-----------|---------|
| [README.md](README.md) | Manual | Workspace overview |
| [CLAUDE.md](CLAUDE.md) | Quarterly | Universal Claude rules; **always loaded** |
| [MASTER_AI_CONTEXT.md](MASTER_AI_CONTEXT.md) | Monthly | Operator profile + global stack preferences |
| [GLOBAL_PROMPT_LIBRARY.md](GLOBAL_PROMPT_LIBRARY.md) | Append-only | Index of cross-project prompts |
| [PROJECT_BOOTSTRAP_CHECKLIST.md](PROJECT_BOOTSTRAP_CHECKLIST.md) | Quarterly | Day-0 checklist for greenfield projects |
| [PROJECT_ONBOARDING_GUIDE.md](PROJECT_ONBOARDING_GUIDE.md) | Quarterly | Day-0 process for brownfield projects |
| [CLAUDE_WORKFLOW_SYSTEM.md](CLAUDE_WORKFLOW_SYSTEM.md) | Quarterly | The 5-loop collaboration cadence |
| [MEMORY_MANAGEMENT_SYSTEM.md](MEMORY_MANAGEMENT_SYSTEM.md) | Semi-annually | Three-layer memory architecture |
| [WORKSPACE_INDEX.md](WORKSPACE_INDEX.md) | On change | This file |

## Numbered category folders

| Folder | Purpose | Headline files |
|--------|---------|----------------|
| [00_TEMPLATES/](00_TEMPLATES/) | Copy-into-new-project scaffolds | `UNIVERSAL_PROJECT_TEMPLATE/` + 9 specialized overlays |
| [01_ACTIVE_PROJECTS/](01_ACTIVE_PROJECTS/) | Live project working copies | Per-project repos |
| [02_ARCHIVED_PROJECTS/](02_ARCHIVED_PROJECTS/) | Read-only sunset projects | Append-only archive log |
| [03_PROMPT_LIBRARIES/](03_PROMPT_LIBRARIES/) | Reusable prompts by domain | 14 domains × multiple prompts |
| [04_AI_MEMORY/](04_AI_MEMORY/) | Workspace-level curated memory | `global/`, `project-snapshots/`, `session-logs/` |
| [05_DOCUMENTATION_STANDARDS/](05_DOCUMENTATION_STANDARDS/) | Markdown / ADR / diagram standards | `AI_READABILITY.md`, `FILE_SIZE_GUIDE.md` |
| [06_BOILERPLATES/](06_BOILERPLATES/) | Runnable starter snippets per stack | `fastapi/logger.py`, `express/logger.ts` |
| [07_MCP_CONFIGURATIONS/](07_MCP_CONFIGURATIONS/) | Reusable MCP server configs | `README.md` |
| [08_DEVOPS_TEMPLATES/](08_DEVOPS_TEMPLATES/) | Dockerfiles, compose, pre-commit | `Dockerfile.node`, `Dockerfile.python`, `docker-compose.dev.yml` |
| [09_DEPLOYMENT_TEMPLATES/](09_DEPLOYMENT_TEMPLATES/) | Per-provider deploy recipes | `aws/`, `gcp/`, `vercel/`, `kubernetes/` |
| [10_SECURITY_TEMPLATES/](10_SECURITY_TEMPLATES/) | Threat model, review checklist | `SECURITY_REVIEW_CHECKLIST.md` |
| [11_REUSABLE_COMPONENTS/](11_REUSABLE_COMPONENTS/) | Cross-project components | Promotion rules |
| [12_DESIGN_SYSTEMS/](12_DESIGN_SYSTEMS/) | Tokens, inventory, brand | Token / inventory / brand layout |
| [13_AUTOMATION_SCRIPTS/](13_AUTOMATION_SCRIPTS/) | Workspace scripts | `bootstrap-project.ps1`, `archive-project.ps1` |
| [14_CI_CD_PIPELINES/](14_CI_CD_PIPELINES/) | CI templates per provider | `github-actions/node-ci.yml`, `python-ci.yml`, `deploy-on-tag.yml` |
| [15_TESTING_FRAMEWORKS/](15_TESTING_FRAMEWORKS/) | Test pyramid + per-tier setup | `TEST_PYRAMID.md` |
| [16_OBSERVABILITY_TEMPLATES/](16_OBSERVABILITY_TEMPLATES/) | SLOs, alerts, OTel setup | `SLO_TEMPLATE.md`, `ALERT_RULES.yaml`, `OTEL_SETUP.md` |
| [17_ARCHITECTURE_BLUEPRINTS/](17_ARCHITECTURE_BLUEPRINTS/) | Reference architectures | `MODULAR_MONOLITH.md`, `RAG_LLM_APP.md` |
| [18_CODING_STANDARDS/](18_CODING_STANDARDS/) | Cross-language + per-language style | `GENERAL.md`, `NAMING.md`, `TYPESCRIPT.md`, `PYTHON.md`, `COMMENTS.md` |
| [19_BUSINESS_REQUIREMENT_TEMPLATES/](19_BUSINESS_REQUIREMENT_TEMPLATES/) | BRD / RFC / One-Pager | `BRD.md`, `RFC.md`, `ONE_PAGER.md` |
| [20_FEATURE_PLANNING_TEMPLATES/](20_FEATURE_PLANNING_TEMPLATES/) | Feature kickoff / launch | `FEATURE_KICKOFF.md`, `LAUNCH_PLAN.md` |
| [21_SPRINT_PLANNING_TEMPLATES/](21_SPRINT_PLANNING_TEMPLATES/) | Sprint / retro | `RETRO.md` |
| [22_GIT_STANDARDS/](22_GIT_STANDARDS/) | Branching, commits, PRs | `BRANCHING.md`, `COMMITS.md` |
| [23_RELEASE_TEMPLATES/](23_RELEASE_TEMPLATES/) | Release notes, rollout checklist | `RELEASE_NOTES.md`, `ROLLOUT_CHECKLIST.md` |
| [24_ENVIRONMENT_TEMPLATES/](24_ENVIRONMENT_TEMPLATES/) | Env matrix, `.env.example` | Universal env matrix |
| [25_API_STANDARDS/](25_API_STANDARDS/) | REST + error envelope | `REST.md`, `ERRORS.md` |
| [26_DATABASE_STANDARDS/](26_DATABASE_STANDARDS/) | Schema + migration rules | `SCHEMA.md`, `MIGRATIONS.md` |
| [27_LOGGING_STANDARDS/](27_LOGGING_STANDARDS/) | Structured JSON conventions | `README.md` |
| [28_MONITORING_STANDARDS/](28_MONITORING_STANDARDS/) | Metrics + SLO + alerts | `README.md` |
| [29_QA_STANDARDS/](29_QA_STANDARDS/) | QA gates and philosophy | `README.md` |
| [30_INCIDENT_RESPONSE/](30_INCIDENT_RESPONSE/) | Playbook + postmortem | `POSTMORTEM_TEMPLATE.md` |

## What lives where (cheat sheet)

| Question | Read |
|----------|------|
| How does Claude behave in this workspace? | `CLAUDE.md` |
| Who am I, what stack do I use? | `MASTER_AI_CONTEXT.md` |
| How do I start a new project? | `PROJECT_BOOTSTRAP_CHECKLIST.md` |
| How do I onboard Claude to an existing project? | `PROJECT_ONBOARDING_GUIDE.md` |
| How do I work with Claude day-to-day? | `CLAUDE_WORKFLOW_SYSTEM.md` |
| How does memory work? | `MEMORY_MANAGEMENT_SYSTEM.md` |
| What prompts can I reuse? | `GLOBAL_PROMPT_LIBRARY.md` |

## Files that always copy into a new project

When `13_AUTOMATION_SCRIPTS/bootstrap-project.ps1` runs, it copies the **entire** `00_TEMPLATES/UNIVERSAL_PROJECT_TEMPLATE/` into `01_ACTIVE_PROJECTS/<slug>/`. The critical files in that template are:

| Path | Why it matters |
|------|----------------|
| `CLAUDE.md` | Project rules Claude reads first |
| `README.md` | Human entry |
| `CONTRIBUTING.md` | Contributor playbook |
| `SECURITY.md` | Disclosure policy |
| `CHANGELOG.md` | Keep-a-Changelog |
| `.env.example` | Env contract |
| `.gitignore` | Universal ignores |
| `ai/context/AI_CONTEXT.md` | Mission, vocab, stakeholders |
| `ai/context/PRODUCT_CONTEXT.md` | Users, KPIs, voice |
| `ai/context/SYSTEM_ARCHITECTURE.md` | C4 system summary |
| `ai/memory/AI_MEMORY.md` | Durable project facts |
| `ai/memory/decisions.md` | ADR index |
| `ai/memory/gotchas.md` | Surprise log |
| `ai/sessions/INDEX.md` | Session log index |
| `docs/architecture/decisions/ADR-TEMPLATE.md` | ADR shape |
| `docs/api/API_REFERENCE.md` | API contract |
| `docs/database/DATABASE_SCHEMA.md` | Schema source of truth |
| `docs/security/SECURITY_GUIDE.md` | Per-project security guide |
| `docs/security/THREAT_MODEL.md` | Per-project STRIDE |
| `docs/deployment/DEPLOYMENT_GUIDE.md` | How to deploy this project |
| `docs/runbooks/INCIDENT_RESPONSE.md` | Incident playbook |
| `docs/runbooks/ROLLBACK.md` | Rollback procedure |
| `docs/observability/OBSERVABILITY_GUIDE.md` | Logs / metrics / traces |
| `docs/product/PRD-v1.md` | Product spec |
| `docs/standards/CODING_STANDARDS.md` | Project style overrides |
| `docs/onboarding/NEW_DEV_DAY_1.md` | First-day procedure |
| `planning/features/_TEMPLATE-feature.md` | Feature one-pager |
| `planning/features/FEATURE_TRACKER.md` | Live feature index |
| `planning/sprints/_TEMPLATE-sprint.md` | Sprint plan |
| `planning/roadmap/ROADMAP.md` | Now / Next / Later |
| `planning/bugs/_TEMPLATE-bug.md` | Bug report |
| `planning/bugs/BUG_LOG.md` | Live bug index |
| `.claude/settings.json` | Per-project Claude config |
| `.claude/agents/README.md` | Subagent inventory |
| `.claude/commands/README.md` | Slash command inventory |
| `.claude/hooks/README.md` | Hook script inventory |
| `.github/workflows/ci.yml` | CI baseline |
| `tests/README.md` | Test pyramid intro |
| `infra/README.md` | IaC conventions |
| `config/environments/README.md` | Env matrix layout |
| `database/migrations/README.md` | Migration rules |

## Files that stay workspace-global (never copy)

- The 8 root anchor files
- All `0X_` / `1X_` / `2X_` / `3X_` numbered category folders
- `04_AI_MEMORY/` contents

## Files that auto-update vs manually maintained

| Auto / generated | Manual |
|------------------|--------|
| `ai/sessions/*` (Claude writes per session) | `CLAUDE.md` |
| `CHANGELOG.md` (from commits at release time) | `MASTER_AI_CONTEXT.md` |
| `docs/api/openapi.yaml` (from code) | `ai/memory/AI_MEMORY.md` |
| Coverage / lint / type reports (CI) | All ADRs |
| `ROADMAP.md` (gets edited often; not generated) | Standards files |

## File naming conventions (used everywhere)

- `kebab-case` for files and folders
- `SCREAMING_SNAKE_CASE.md` for **canonical doc files** (CLAUDE.md, README.md, etc.) and indices
- `_TEMPLATE-<name>.md` for skeleton files meant to be copied
- `ADR-NNNN-<slug>.md` for ADRs (zero-padded)
- `BUG-NNNN-<slug>.md` for bug reports
- `FEAT-NNNN-<slug>.md` for feature one-pagers
- `YYYY-MM-DD-<slug>.md` for session logs and postmortems

## Cross-linking rule

Always link with **relative markdown** from the current file. Example:
```markdown
[Threat model](../security/THREAT_MODEL.md)
```
Never link to absolute paths or bare-text "see THREAT_MODEL". Claude follows markdown links; humans use the IDE integration.

## Versioning

The workspace itself is git-tracked. Tag the workspace when you ship meaningful changes:
- `v1.0.0` — initial release
- Bump MINOR on category additions
- Bump PATCH on doc clarifications
- Bump MAJOR if you reorganize the numbered folders

Per-project repos version independently.

## Backup

This entire workspace lives at:
`C:\Users\dhanveerp\Documents\Claude Pro Max`
and is mirrored to:
`https://github.com/mpdhanveer05-prakash/claude-engineering-system`

If the local copy is lost: `git clone <remote>` recovers it.

---

*Last updated: 2026-05-18*
