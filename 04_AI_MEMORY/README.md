# 04_AI_MEMORY

Workspace-level long-term memory. Separate from each project's `ai/memory/` and from Claude's auto memory at `~/.claude/projects/.../memory/`.

## Layout
```
04_AI_MEMORY/
├── README.md                       # this file
├── global/                         # cross-project facts
│   ├── operator-profile.md
│   ├── stack-preferences.md
│   ├── anti-patterns.md
│   └── vendor-accounts.md
├── project-snapshots/              # frozen point-in-time summaries per project
│   └── <project-slug>/
│       ├── snapshot-YYYY-MM-DD.md
│       └── retrospective.md
└── session-logs/                   # optional weekly roll-up of project sessions
    └── <project-slug>/
        └── YYYY-WW.md
```

## What goes here vs project `ai/memory/`
| Scope | Place |
|-------|-------|
| True across multiple projects | `global/` |
| True for one project only | that project's `ai/memory/` |
| Point-in-time snapshot for archive / audit | `project-snapshots/` |
| Rolling cross-project insight | `session-logs/` |

## Pruning
- `global/`: audit quarterly. Stale fact = remove or refresh.
- `project-snapshots/`: append-only. Never edit a snapshot after writing.
- `session-logs/`: optional; keep only if you re-read them.

## Backup
This folder is the most valuable in the workspace. Make sure it's:
- In version control (this repo)
- Backed up (cloud sync OR pushed to a private remote regularly)
- Reviewed when you change roles, employer, focus area

See `../MEMORY_MANAGEMENT_SYSTEM.md` for the full memory architecture.
