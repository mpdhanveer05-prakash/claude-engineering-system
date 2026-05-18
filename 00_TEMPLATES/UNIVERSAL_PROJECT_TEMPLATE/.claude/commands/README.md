# .claude/commands/

Project-level slash commands. Each file = `/command-name`.

Format:

```markdown
---
description: <short description>
---
<prompt body — may reference $ARGUMENTS>
```

## Suggested commands

- `/feature <slug>` — scaffold a new entry under `planning/features/`
- `/bug <slug>` — scaffold a new entry under `planning/bugs/`
- `/adr <slug>` — scaffold a new ADR under `docs/architecture/decisions/`
- `/session-end` — write today's session log + update memory
- `/release <version>` — draft release notes from commits since last tag
- `/onboard` — produce the codebase snapshot per `PROJECT_ONBOARDING_GUIDE.md`
