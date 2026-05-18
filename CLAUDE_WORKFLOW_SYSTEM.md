# CLAUDE_WORKFLOW_SYSTEM.md

> The end-to-end workflow for working with Claude across the software lifecycle. Treat this as a runbook for *how to collaborate*, not what to build.

---

## The 5 Loops

Claude collaboration runs at five nested cadences. Each has its own ritual.

```
Session loop (minutes-hours) → inside →
Task loop (hours-days)       → inside →
Sprint loop (days-weeks)     → inside →
Release loop (weeks-months)  → inside →
Project loop (months-years)
```

---

## 1. Session Loop — Inside a single Claude conversation

### Opening ritual

1. State the goal in one sentence.
2. Tell Claude what context to load: project `CLAUDE.md` + the relevant docs.
3. If it's been >1 day since the last session, ask: *"Read `ai/sessions/` and summarize where we left off."*

### Working ritual

- **One task in flight at a time.** Use TodoWrite when >3 steps.
- **Tight loops:** edit → run → check. Don't batch 5 edits before testing.
- **Push back.** If Claude's plan seems wrong, course-correct early.
- **No silent expansions.** If Claude wants to refactor adjacent code, decide explicitly.

### Closing ritual

1. Ask Claude to write the session log: `ai/sessions/YYYY-MM-DD-<slug>.md` covering: goal, what changed, what didn't, decisions, open questions.
2. If a durable fact emerged (a non-obvious gotcha, a convention worth keeping), Claude updates `ai/memory/AI_MEMORY.md`.
3. Commit. Always commit, even if WIP — onto a feature branch.

### Session log template

```markdown
---
date: YYYY-MM-DD
duration_min: 45
goal: <one sentence>
status: <complete | partial | blocked>
---

## What changed
- file:lines — what
## What I tried that didn't work
- ...
## Decisions
- ...
## Open questions for next session
- ...
## Files touched
- src/foo.ts, src/bar.ts, tests/foo.test.ts
```

---

## 2. Task Loop — A single ticket / feature / bug

### Phases

| Phase | Output | Files updated |
|-------|--------|---------------|
| Intake | One-pager | `planning/features/<slug>.md` |
| Design | ADR or design note | `docs/architecture/decisions/ADR-NNNN.md` |
| Build | Code + tests | source files |
| Verify | Test runs green, perf within budget | CI logs |
| Document | Updated reference docs | `docs/api/`, `docs/database/`, etc. |
| Ship | Release notes line | `CHANGELOG.md` |
| Learn | Memory/feedback update if applicable | `ai/memory/AI_MEMORY.md` |

### Task one-pager template

```markdown
# <Task Title>

**Type:** feature | bug | refactor | spike | chore
**Owner:** <human>
**Reviewers:** <humans>
**Target release:** vX.Y.Z

## Why
<1-2 sentences of user value>

## Acceptance criteria
- [ ] ...
- [ ] ...

## Non-goals
- ...

## Approach
<3-5 bullets>

## Risk
- ...

## Test plan
- Unit: ...
- Integration: ...
- E2E: ...
- Manual: ...

## Rollout
- Feature flag: <name> default off
- Migration: <plan>
- Rollback: <plan>
```

---

## 3. Sprint Loop — 1–2 weeks of tasks

### Cadence

- **Day 1:** Sprint kickoff. Claude reads `planning/roadmap/` + `planning/bugs/` and proposes a candidate sprint plan. Human refines.
- **Mid-sprint:** Standup file `planning/sprints/<sprint-id>/standup-YYYY-MM-DD.md`: yesterday/today/blockers.
- **Last day:** Sprint demo notes + retro. Claude drafts the retro from session logs and the sprint board.

### Sprint plan template

```markdown
# Sprint <id> (YYYY-MM-DD → YYYY-MM-DD)

## Theme
<one sentence>

## Goals
1. ...
2. ...
3. ...

## Committed
| ID | Task | Owner | Estimate | Status |
| ... |

## Stretch
| ... |

## Risks
- ...

## Definition of done
- All committed items merged, tested, deployed to staging
- All committed items have updated docs
- No regressions in observability dashboards
```

---

## 4. Release Loop — Tag / version

### Pre-release checklist

- [ ] All sprint items merged
- [ ] `CHANGELOG.md` updated (Claude drafts from commits + PR titles)
- [ ] Release notes for users in `docs/releases/vX.Y.Z.md`
- [ ] Migration runbook if breaking
- [ ] Rollback rehearsed in staging
- [ ] On-call notified
- [ ] Status page banner ready if user-visible

### Release notes template

```markdown
# vX.Y.Z — <Codename>

**Released:** YYYY-MM-DD
**Audience:** customers | internal | both

## Highlights
- ...

## New
- ...

## Improved
- ...

## Fixed
- ...

## Breaking
- ...

## Deprecated
- ...

## Migration notes
- ...

## Known issues
- ...
```

---

## 5. Project Loop — Birth, growth, sunset

### Phases

| Phase | Marker | Claude's role |
|-------|--------|---------------|
| Inception | Idea → PRD → ADR-0001 | Product partner |
| Bootstrap | First commit → first deploy | Scaffolding engineer |
| Growth | First user → product-market fit | Feature factory + reviewer |
| Scale | First incident → SLOs in place | Architect + ops |
| Mature | Modernization, debt paydown | Refactor partner |
| Sunset | Migration plan → archive | Migration scribe |

### When to archive

- Project has been read-only for >6 months
- No user is on it anymore
- All data migrated to successor

To archive: `Move-Item 01_ACTIVE_PROJECTS/<slug> 02_ARCHIVED_PROJECTS/<slug>` + add a one-line entry to `02_ARCHIVED_PROJECTS/README.md` with sunset date and reason.

---

## Multi-Agent Workflow

Use the Agent tool / subagents when:

- **Explore** — open-ended search across >3 files, you want results without burning your context window
- **Plan** — designing a non-trivial implementation; want a structured plan back
- **Code review** — second opinion on a diff (use a freshly-prompted agent for true independence)
- **Long-running research** — comparing libraries, reading docs, summarizing

### Spawn-in-parallel pattern

```
You: I need to ship a feature touching auth, billing, and email.
You: Spawn 3 explorers in parallel — one for each subsystem — to scope the change.
Claude: <single message, 3 Agent calls in parallel>
```

### Spawn-sequential pattern

For tasks where one agent's output feeds the next: don't parallelize. Plan → Implement → Review is sequential.

### Agent context hygiene

Agents are stateless across runs. Brief them like a colleague: goal, what you've ruled out, exact paths, expected output shape.

---

## When Things Go Wrong

| Symptom | First check | Then |
|---------|-------------|------|
| Claude hallucinated a function | Did context include the file? | Add to context, retry |
| Claude keeps repeating a mistake | Is `AI_MEMORY.md` missing the rule? | Add it; reference in CLAUDE.md |
| Claude over-refactored | Was scope explicit? | Add "Forbidden actions" rule; revert |
| Claude went silent / vague | Context exhausted? | Restart fresh session with summary |
| Claude misunderstood the domain | Is `PRODUCT_CONTEXT.md` thin? | Expand the glossary section |

---

## The Three Rules

1. **Context is the unit of work.** Every output is only as good as the context it was given.
2. **Verification beats trust.** Always run tests, types, lints before "done."
3. **Document the surprise.** If something surprised you (good or bad), it surprises future-Claude too. Write it down.

---

*Update frequency: review quarterly. Workflows that no one follows should be removed.*
