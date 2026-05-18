# ai/prompts/ — Project-Specific Prompts

> Reusable prompts unique to **this** project. Cross-project prompts live in the workspace `03_PROMPT_LIBRARIES/`.

## When to add a prompt here

- You've written the same instruction to Claude twice → make it a file.
- The prompt requires project-specific context (e.g., the data model, the auth flow).

## Format

```markdown
# <Prompt Name>
**Goal:** ...
**When to use:** ...
**Inputs:** ...
**Output shape:** ...
---
<prompt body, with {PLACEHOLDERS} for variables>
```

## Suggested starter prompts

- `add-api-endpoint.md` — encodes this project's API conventions
- `add-migration.md` — encodes this project's migration safety rules
- `add-feature-flag.md` — wires GrowthBook + telemetry
- `bug-triage.md` — encodes this project's repro + log-grepping playbook
- `release-notes.md` — encodes this project's customer voice
