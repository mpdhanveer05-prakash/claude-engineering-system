# Claude Pro Max — AI Engineering Operating System

> The permanent AI-assisted engineering workspace for every project, prompt, template, and standard.

This workspace is the **single source of truth** for how Claude collaborates on software at every stage of the lifecycle: idea → architecture → MVP → scale → maintenance → retirement.

---

## Top-Level Layout

| Path | Purpose | Lifecycle |
|------|---------|-----------|
| `CLAUDE.md` | Universal root instructions Claude reads on every session inside this workspace | Manual / quarterly |
| `MASTER_AI_CONTEXT.md` | Global AI context (your role, domains, conventions, preferences) | Manual / monthly |
| `GLOBAL_PROMPT_LIBRARY.md` | Cross-project reusable prompt index | Manual / on insight |
| `PROJECT_BOOTSTRAP_CHECKLIST.md` | Day-zero checklist for any new project | Manual / quarterly |
| `PROJECT_ONBOARDING_GUIDE.md` | How to onboard Claude into an existing codebase | Manual / quarterly |
| `CLAUDE_WORKFLOW_SYSTEM.md` | The end-to-end Claude-collaboration workflow | Manual / quarterly |
| `MEMORY_MANAGEMENT_SYSTEM.md` | Long-term memory architecture and rules | Manual / quarterly |
| `00_TEMPLATES/` | Copy-into-new-project scaffolds (universal + specialized) | Versioned |
| `01_ACTIVE_PROJECTS/` | Symlinks or working copies of every active project | Live |
| `02_ARCHIVED_PROJECTS/` | Frozen snapshots of completed/sunset projects | Append-only |
| `03_PROMPT_LIBRARIES/` | Domain-organized prompt collections | Append-only |
| `04_AI_MEMORY/` | Workspace-level long-term memory (separate from per-project memory) | Auto + manual |
| `05_DOCUMENTATION_STANDARDS/` | Markdown, ADR, diagram, naming standards | Manual / quarterly |
| `06_BOILERPLATES/` | Runnable starter code for common stacks | Versioned |
| `07_MCP_CONFIGURATIONS/` | Reusable MCP server configs | Versioned |
| `08_DEVOPS_TEMPLATES/` | Dockerfiles, Terraform modules, Helm charts | Versioned |
| `09_DEPLOYMENT_TEMPLATES/` | Provider-specific deployment recipes | Versioned |
| `10_SECURITY_TEMPLATES/` | Threat-models, IAM policies, security checklists | Manual |
| `11_REUSABLE_COMPONENTS/` | Cross-project component snippets | Versioned |
| `12_DESIGN_SYSTEMS/` | Tokens, components, brand assets | Versioned |
| `13_AUTOMATION_SCRIPTS/` | Workspace-level scripts (bootstrap, scan, archive) | Versioned |
| `14_CI_CD_PIPELINES/` | GH Actions / GitLab / CircleCI templates | Versioned |
| `15_TESTING_FRAMEWORKS/` | Test pyramid templates, fixture conventions | Versioned |
| `16_OBSERVABILITY_TEMPLATES/` | Dashboards, alerts, log schemas | Versioned |
| `17_ARCHITECTURE_BLUEPRINTS/` | Reference architectures (event-driven, serverless, microservice, etc.) | Manual |
| `18_CODING_STANDARDS/` | Language-specific style and review rules | Manual |
| `19_BUSINESS_REQUIREMENT_TEMPLATES/` | PRD, BRD, RFC templates | Manual |
| `20_FEATURE_PLANNING_TEMPLATES/` | Feature one-pager, kickoff, exit | Manual |
| `21_SPRINT_PLANNING_TEMPLATES/` | Sprint plan, retro, demo notes | Manual |
| `22_GIT_STANDARDS/` | Branching, commit, PR, review rules | Manual |
| `23_RELEASE_TEMPLATES/` | Release notes, rollout checklist, rollback | Manual |
| `24_ENVIRONMENT_TEMPLATES/` | .env, secrets, env-matrix templates | Manual |
| `25_API_STANDARDS/` | REST/GraphQL/gRPC style guides | Manual |
| `26_DATABASE_STANDARDS/` | Schema, migration, naming, indexing rules | Manual |
| `27_LOGGING_STANDARDS/` | Structured logging schema and rules | Manual |
| `28_MONITORING_STANDARDS/` | SLO/SLI/alert conventions | Manual |
| `29_QA_STANDARDS/` | QA gates, exploratory testing, regression policy | Manual |
| `30_INCIDENT_RESPONSE/` | Incident playbook, severity matrix, postmortem | Manual |

---

## Two Memory Systems — Don't Confuse Them

1. **Claude's built-in memory** (lives at `~/.claude/projects/.../memory/`) — auto-managed by the assistant for user/feedback/project/reference facts across sessions.
2. **This workspace's memory** (`04_AI_MEMORY/`) — human-curated, version-controllable knowledge per-project and per-domain. Mirrors what teams traditionally store in Confluence/Notion but optimized for Claude ingestion.

The two complement each other. See [MEMORY_MANAGEMENT_SYSTEM.md](MEMORY_MANAGEMENT_SYSTEM.md).

---

## How to Start a New Project (30-second version)

```powershell
# 1. Copy the universal template
Copy-Item -Recurse "00_TEMPLATES\UNIVERSAL_PROJECT_TEMPLATE" "01_ACTIVE_PROJECTS\my-new-project"

# 2. cd in, init git, fill out CLAUDE.md and docs/product/PRODUCT_CONTEXT.md
# 3. Walk PROJECT_BOOTSTRAP_CHECKLIST.md top-to-bottom
```

Full instructions: [PROJECT_BOOTSTRAP_CHECKLIST.md](PROJECT_BOOTSTRAP_CHECKLIST.md)

## How to Onboard Claude to an Existing Project

See [PROJECT_ONBOARDING_GUIDE.md](PROJECT_ONBOARDING_GUIDE.md).

---

## Maintenance Cadence

| Cadence | Action |
|---------|--------|
| Per session | Update active project's `ai/sessions/` log |
| Daily | Update `planning/sprints/current.md` |
| Weekly | Sync `FEATURE_TRACKER.md`, `BUG_LOG.md` |
| Monthly | Review `MASTER_AI_CONTEXT.md`, prune stale prompts |
| Quarterly | Audit standards folders, version templates |
| On release | Update `RELEASE_NOTES.md`, archive completed sprints |
| On incident | File postmortem in `30_INCIDENT_RESPONSE/postmortems/` |

---

## Design Principles

1. **Plain Markdown, no proprietary formats** — Claude reads it, humans read it, git diffs it.
2. **Convention over configuration** — every project gets the same skeleton.
3. **Context lives next to code** — `ai/` folder ships inside every project.
4. **One source of truth per fact** — cross-link, never duplicate.
5. **Files are small and focused** — see [05_DOCUMENTATION_STANDARDS/FILE_SIZE_GUIDE.md](05_DOCUMENTATION_STANDARDS/).
6. **Everything is reversible** — templates are copies, not symlinks; archives are append-only.
