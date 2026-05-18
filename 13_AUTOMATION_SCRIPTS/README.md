# 13_AUTOMATION_SCRIPTS

Workspace-level scripts: bootstrap a new project, scan an existing one, archive a sunset project, audit memory.

| File | Purpose |
|------|---------|
| `bootstrap-project.ps1` | Copy UNIVERSAL_PROJECT_TEMPLATE → 01_ACTIVE_PROJECTS/<slug> |
| `archive-project.ps1` | Move project → 02_ARCHIVED_PROJECTS + freeze |
| `scan-codebase.ps1` | Run the onboarding scan against a path (read-only) |
| `audit-memory.ps1` | Surface stale memory entries (>180 days untouched) |
| `verify-cross-links.ps1` | Walk markdown, report broken relative links |

Rules:
- Idempotent — safe to rerun
- Confirm before any destructive action
- Print what they did at the end
- Cross-platform via PowerShell Core (`pwsh`) where possible
