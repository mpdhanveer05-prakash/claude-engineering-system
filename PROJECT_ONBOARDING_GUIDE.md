# PROJECT_ONBOARDING_GUIDE.md

> How to drop Claude into an **existing** codebase and have it productive within a day. The bootstrap checklist is for greenfield; this is for brownfield.

---

## Phase 0 — Set Expectations (15 min)

Existing projects come with archaeology, dead code, and tribal knowledge. Onboarding is **discovery + documentation**, not "write features." Do not let Claude refactor in Day 1.

## Phase 1 — Snapshot the Codebase (30 min)

Use this prompt to start:

> "You are joining an existing codebase. Do NOT modify any files. Walk the repo and produce a `docs/onboarding/CODEBASE_SNAPSHOT.md` with these sections:
> 1. Top-level folder tree (2 levels deep) with a one-line purpose for each.
> 2. Detected stack (languages, frameworks, build tools, package managers).
> 3. Detected entry points (`main`, `index`, server bootstrap).
> 4. Detected services (CLI, web, worker, etc.).
> 5. Detected DB(s) and migration tool.
> 6. Detected CI/CD providers and pipelines.
> 7. Test frameworks in use and rough coverage shape.
> 8. Third-party SDKs imported (group by category: auth, payments, observability, etc.).
> 9. Anything that looks abandoned (last-touched dates, unused exports).
> 10. Top 5 unanswered questions for a human."

Run this in **read-only mode** — no edits.

## Phase 2 — Establish AI Context (1h)

Create the `ai/` folder if it doesn't exist:

```
ai/
├── context/
│   ├── AI_CONTEXT.md           # mission, stakeholders, vocab
│   ├── PRODUCT_CONTEXT.md      # users, value, KPIs
│   └── SYSTEM_ARCHITECTURE.md  # what runs where, generated from snapshot
├── memory/
│   └── AI_MEMORY.md            # starts empty; populated as patterns emerge
├── prompts/
│   └── project-specific.md
└── sessions/
    └── YYYY-MM-DD-onboarding.md
```

Use the **`UNIVERSAL_PROJECT_TEMPLATE/ai/`** subtree as the source skeleton — copy in, don't rewrite.

## Phase 3 — Reconstruct the Architecture (2–4h)

Prompt:

> "Read `src/`, `app/`, and any service entry points. Generate `docs/architecture/SYSTEM_ARCHITECTURE.md` containing:
> - C4 Context diagram (Mermaid) of external actors and systems.
> - C4 Container diagram of internal services and how they communicate.
> - Per-container: language, framework, deploy target, owner (unknown if so).
> - Cross-cutting concerns: auth flow, logging path, error path, config loading.
> - Mark every diagram with `Confidence: high/medium/low` and what evidence backed it.
> Where evidence is missing, write `TODO(human): ...` rather than guessing."

## Phase 4 — Reconstruct the Data Model (1–2h)

Prompt:

> "Read the migrations folder and any ORM models. Produce `docs/database/DATABASE_SCHEMA.md` with:
> - Per-table: columns, types, constraints, indexes, FK relationships.
> - ERD in Mermaid `erDiagram` form.
> - Per-table: estimated row count source (if computable) or `unknown`.
> - Implicit relationships not modeled as FKs (string IDs, polymorphic refs).
> - Migration anti-patterns spotted (down-migrations missing, etc.)."

## Phase 5 — Document the API Surface (1–2h)

Prompt:

> "Walk the routing layer. Produce `docs/api/API_REFERENCE.md` listing every route with: method, path, auth required, request shape, response shape, side effects, owning module. Generate an OpenAPI 3.1 spec next to it at `docs/api/openapi.yaml`. Where types are loose, list the inferred shape and mark `confidence: low`."

## Phase 6 — Find Technical Debt (2h)

Prompt:

> "Scan the codebase for technical debt indicators. Produce `docs/onboarding/TECH_DEBT_REGISTER.md` listing for each item:
> | ID | Location | Category | Severity (1-5) | Effort (S/M/L) | Risk if ignored | Suggested fix |
>
> Categories: security, performance, correctness, maintainability, dependency, test-coverage, observability, dead-code.
> Cap the list at 30 items, ranked by Severity × (6 − Effort)."

## Phase 7 — Build a Dependency Map (1h)

Prompt:

> "Produce `docs/architecture/DEPENDENCY_MAP.md`:
> 1. Internal module dependency graph (Mermaid) — flag cycles.
> 2. External package dependency table with: name, version, license, last-update, security advisories.
> 3. Vendor service dependency table: which features break if vendor X goes down.
> 4. Bus-factor estimate per module (best-guess from git blame distribution)."

## Phase 8 — Identify Risk Hot-Spots (1h)

Prompt:

> "From the snapshot, debt register, and dependency map, produce `docs/onboarding/RISK_HOTSPOTS.md` ranking the top 10 files/modules where a change is most likely to break something. For each, list the reason (high churn, low test coverage, complex, central) and suggested mitigation (test first, refactor, document)."

## Phase 9 — Build a Migration / Modernization Plan (optional, 2h)

Only if the user has signaled intent to modernize. Otherwise skip.

Prompt:

> "Given the snapshot, debt register, and hotspots, draft `docs/onboarding/MODERNIZATION_PLAN.md` with 3 horizons:
> - 0–3 months: safe wins (tooling, CI, test scaffolding)
> - 3–9 months: structural (boundaries, contracts, observability)
> - 9–24 months: strategic (replatform, rewrite, retire)
> For each item: outcome, prerequisites, risk, estimated effort."

## Phase 10 — Hand-Off Document (30 min)

Generate `docs/onboarding/CLAUDE_HANDOFF.md`:

> "Summarize everything you learned about this codebase in ≤2000 words. Format: Overview, Architecture, Data, API, Strengths, Weaknesses, Top 5 Recommendations, Open Questions for the Human."

This becomes the **canonical entry-point** for any future Claude session on this project.

## Phase 11 — Project CLAUDE.md (30 min)

Now that you understand the code, write a `CLAUDE.md` at the project root that:

- Names the project, its purpose, and its users
- Specifies the resolved tech stack (versions matter)
- Lists actually-enforced coding conventions (not aspirational ones)
- Lists forbidden actions specific to this codebase (e.g., "do not touch `legacy/` without ADR")
- Points Claude at the docs you just generated as the canonical context

## Phase 12 — First Productive Task

Choose something **small, safe, and visible**:

- Add a missing test for a high-risk hotspot
- Fix one low-severity bug
- Add structured logging to one entry point
- Write the missing README for one module

The goal is to validate the onboarding context worked. If Claude misunderstands the codebase doing a small task, your context docs need iteration.

---

## Anti-Patterns to Avoid

| Anti-pattern | Why it's bad |
|--------------|--------------|
| Letting Claude refactor on Day 1 | No baseline understanding → cascading breakage |
| Generating docs without reading code | Hallucinated architecture |
| Skipping the dependency map | First incident reveals coupling you didn't know about |
| Documenting *aspirations* in CLAUDE.md | Claude obeys docs literally; lying to it punishes you later |
| Onboarding more than one repo in parallel | Context bleed; finish one, then the next |

## Onboarding-Mode Permissions

Configure `.claude/settings.json` in onboarding to:

- Allow: Read, Grep, Glob, Bash (read-only: `git log`, `git diff`, `ls`)
- Prompt: Write, Edit (only inside `docs/onboarding/`)
- Deny: Bash for anything that mutates state

Promote permissions back to normal only after Phase 11.

---

*Estimated total: 1–2 working days for a mid-sized codebase. 3–5 days for a large monorepo.*
