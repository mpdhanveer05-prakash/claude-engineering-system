# MEMORY_MANAGEMENT_SYSTEM.md

> The architecture, rules, and rituals for managing AI memory across this workspace. Memory is a **first-class engineering artifact**, not an afterthought.

---

## 1. The Three Memory Layers

| Layer | Lives in | Scope | Persistence | Owner |
|-------|----------|-------|-------------|-------|
| **Conversation context** | Claude's working memory | Current session | Until session ends | Claude |
| **Auto memory** | `~/.claude/projects/.../memory/` | Cross-session, per workspace | Until pruned | Claude (auto-managed) |
| **Curated memory** | This workspace's `04_AI_MEMORY/` + per-project `ai/memory/` | Cross-session, version-controlled | Forever (until you delete) | You |

The first two are **Claude-managed**. The third is **human-curated** — it survives Claude version upgrades, can be diff'd in git, and is shareable across teams.

---

## 2. Workspace-Level Memory (`04_AI_MEMORY/`)

Structure:

```
04_AI_MEMORY/
├── README.md
├── global/
│   ├── operator-profile.md       # who you are, how you work
│   ├── stack-preferences.md      # default stacks across projects
│   ├── anti-patterns.md          # personal "do not do this" list
│   └── vendor-accounts.md        # SaaS tools in use
├── project-snapshots/
│   └── <project-slug>/
│       ├── snapshot-YYYY-MM-DD.md   # frozen state summary
│       └── retrospective.md
└── session-logs/
    └── <project-slug>/
        └── YYYY-MM-DD-<slug>.md    # ← rolls up from project ai/sessions/
```

### Rules

- **Global** = facts true for >1 project. If it's only true for one project, it belongs in that project's `ai/memory/`.
- **Snapshots** = point-in-time summaries; never edited after writing, only superseded.
- **Session logs** = optional weekly aggregation of per-project session files for cross-project insight.

---

## 3. Project-Level Memory (per-project `ai/`)

Inside every project (copied from `UNIVERSAL_PROJECT_TEMPLATE/ai/`):

```
ai/
├── context/
│   ├── AI_CONTEXT.md             # mission, stakeholders, vocab
│   ├── PRODUCT_CONTEXT.md        # users, KPIs, market
│   └── SYSTEM_ARCHITECTURE.md    # what runs where
├── memory/
│   ├── AI_MEMORY.md              # durable facts about this project
│   ├── decisions.md              # mini-ADR list (one-liners + link to full ADRs)
│   └── gotchas.md                # things that surprised us
├── prompts/                      # project-specific reusable prompts
├── agents/                       # project-specific subagent definitions
└── sessions/                     # session logs (newest first)
    ├── INDEX.md
    └── YYYY-MM-DD-<slug>.md
```

### Per-project memory rules

- `AI_CONTEXT.md` ≤ 500 lines — split into sub-files if it grows past that.
- `AI_MEMORY.md` is a **list of durable facts**, not a journal. Format:

```markdown
## Fact: <one-line title>
**Type:** invariant | gotcha | preference | constraint
**Added:** YYYY-MM-DD by <author>
**Why it matters:** <one sentence>
**Apply when:** <trigger>
```

- `gotchas.md` is for *surprises* — bugs whose root cause was non-obvious, libraries that misbehave, infra footguns.
- `decisions.md` is one line per decision: `[ADR-0007](../../docs/architecture/decisions/ADR-0007-foo.md) — pick X over Y because Z`.

---

## 4. Context Hierarchy (Resolution Order)

When Claude needs to know "what's the rule for X?", it walks this order:

1. Current file being edited (literal evidence)
2. Project `CLAUDE.md`
3. Project `ai/context/` and `ai/memory/`
4. Project `docs/standards/`
5. Workspace `CLAUDE.md` (root)
6. Workspace standards (`18_CODING_STANDARDS/`, etc.)
7. `MASTER_AI_CONTEXT.md`
8. Built-in defaults

State the source when applying a rule, especially if there's a near-conflict.

---

## 5. Context Compression Strategy

When context windows get tight (large diffs, long sessions):

### Tier 1 — Keep always
- Current file(s) under edit
- Project `CLAUDE.md`
- `ai/memory/AI_MEMORY.md`
- The relevant single doc for the task

### Tier 2 — Drop first
- Historical session logs (load only the most recent)
- Archived ADRs (load only ones referenced by current ADR)
- Anything in `02_ARCHIVED_PROJECTS/`
- This `MEMORY_MANAGEMENT_SYSTEM.md` (you've already internalized it)

### Compression techniques
- Use **Explore subagent** for grep/search — returns summaries, not raw content.
- Use **Plan subagent** to design before implementing — keeps planning context separate from implementation context.
- **Summarize and discard** — ask Claude to write a 500-word summary of the last hour and start a new session loaded with just the summary.

---

## 6. Long-Term Memory Strategy

The traps:

- **Memory rot** — stale memory is worse than no memory (Claude acts on lies).
- **Memory bloat** — too many facts → none get read.
- **Memory drift** — what's true at session start may not be true at session end.

The rules:

1. **Verify before applying.** A memory says X exists → check it still exists.
2. **Date every memory entry.** If it's >6 months old and untouched, audit it.
3. **Prefer specific over general.** `Stripe webhooks deduplicate by event.id in src/billing/webhooks.ts:42` beats `webhooks are deduplicated`.
4. **Cap project `AI_MEMORY.md` at ~200 lines.** Beyond that, split by domain (`AI_MEMORY_BILLING.md`, `AI_MEMORY_AUTH.md`).
5. **Audit quarterly.** Walk through, delete obvious cruft, refresh anything stale.

---

## 7. Session Continuation Strategy

When picking up after a break:

```
You: Continue the work from <last session date>.
Claude: <reads ai/sessions/INDEX.md and the latest session>
Claude: "Last session you were at <state>. Pending: <list>. Should I continue with <task>?"
You: <yes / redirect>
```

The session log is the **handoff document**. Treat writing it as part of "done."

---

## 8. Multi-Agent Memory

Subagents don't see each other's context. Memory bridges them.

Pattern:

1. **Lead agent (you-driven Claude)** owns the `ai/memory/`.
2. Before spawning a subagent, lead writes any context it needs into the prompt or a temp file.
3. Subagent returns a result.
4. Lead distills durable findings into `ai/memory/`.

Never let two subagents write to the same memory file in parallel — race conditions on documentation are real.

---

## 9. Memory Anti-Patterns

| Anti-pattern | Fix |
|--------------|-----|
| Writing recap-style "today we did X" entries | Recaps belong in session logs, not memory. Memory = durable rules. |
| Writing memory for things in the code | If it's in the code, the code is the source. Don't duplicate. |
| Never deleting memory entries | Memory is curated, not append-only. Prune. |
| Memory entries with no "why" | A rule without rationale can't be judged at edge cases. Always include why. |
| Saving secrets, tokens, customer data | These belong in a vault, not in a markdown file under git. |

---

## 10. Backup & Versioning

- Each project's `ai/` ships in git → version-controlled by default.
- Workspace `04_AI_MEMORY/` should be backed up (cloud sync or a separate git repo).
- Snapshots in `project-snapshots/` are git-tracked but never edited after creation — they're history.
- Recommended: `git init` inside `Claude Pro Max/` and push to a private remote. Memory you can't recover is memory you don't have.

---

## 11. The Three Memory Questions

Ask before saving anything:

1. **Is this durable?** (true in 6 months) → save. Else → session log.
2. **Is it general?** (true for >1 file) → save to project memory. (true for >1 project) → save to workspace memory.
3. **Is it surprising?** (non-obvious from reading the code) → save. (obvious from code) → don't save.

If all three are "yes," it's a memory. Otherwise, it's noise.

---

*Update frequency: review semi-annually. Memory systems decay; audit them like you would dependencies.*
