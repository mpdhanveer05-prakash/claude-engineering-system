# 02_ARCHIVED_PROJECTS

Sunset projects, frozen. **Read-only.** Never edit files in this folder.

## Archive log

| Sunset date | Project | Why | Successor | Final commit |
|-------------|---------|-----|-----------|--------------|
| _(none yet)_ | | | | |

## Why we keep them
- Audit trail for compliance / IP
- Future reference for code / approach
- Learning material
- Forensics if a related issue surfaces

## What "frozen" means
- No edits
- No dependency upgrades
- CI disabled for the archived path
- Secrets rotated and revoked

## Restoring
If you need to revive an archived project:
1. Copy to `01_ACTIVE_PROJECTS/<slug>`.
2. Treat as legacy — walk `PROJECT_ONBOARDING_GUIDE.md`.
3. Rotate credentials, audit dependencies, rebuild CI before touching code.
