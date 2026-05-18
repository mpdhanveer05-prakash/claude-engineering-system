# .claude/agents/

Subagents Claude Code can spawn from this project. Each is a single markdown file with frontmatter.

```
---
name: <agent-name>
description: <when to use>
tools: <comma-separated tool list, or "*">
model: opus | sonnet | haiku
---

<system prompt body>
```

See [Anthropic Claude Code subagents docs](https://docs.anthropic.com/en/docs/claude-code/sub-agents) for the full spec.

## Suggested agents to add

- `api-builder.md` — implements a new endpoint per `docs/api/API_REFERENCE.md` conventions
- `migration-writer.md` — writes safe forward-only migrations
- `runbook-author.md` — authors runbooks in `docs/runbooks/`
- `pr-reviewer.md` — pre-PR self-review against project standards
- `regression-test-writer.md` — writes a failing test that captures a bug repro
