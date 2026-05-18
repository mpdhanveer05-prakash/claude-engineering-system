# ai/agents/ — Project-Specific Subagent Definitions

> Custom subagents tuned for this project. These overlay any global agents.

## File format

Each agent is a single markdown file with frontmatter Claude Code reads:

```markdown
---
name: api-builder
description: Adds a new REST endpoint following this project's conventions (auth, tenant, validation, OpenAPI, test).
tools: Read, Edit, Write, Grep, Glob, Bash
model: sonnet
---

You are a senior backend engineer. Add a new endpoint to this codebase.

Conventions you must follow:
- ...
- ...

Definition of done:
- ...
```

## Recommended starter agents

- `api-builder.md` — builds an endpoint end-to-end per project conventions
- `migration-writer.md` — writes a zero-downtime migration with the project's migration tool
- `feature-flag-wirer.md` — wires a new flag through code + telemetry + docs
- `runbook-author.md` — writes a runbook for a new service in `docs/runbooks/`

## Symlinks

Project-specific agents in `ai/agents/` should also be referenced from `.claude/agents/` so Claude Code picks them up. Either symlink or copy on each change.
