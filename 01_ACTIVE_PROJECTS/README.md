# 01_ACTIVE_PROJECTS

Every project you're currently shipping or maintaining lives here as a working copy.

## Adding a project

```powershell
$slug = "my-new-project"
$root = "C:\Users\dhanveerp\Documents\Claude Pro Max"
Copy-Item -Recurse "$root\00_TEMPLATES\UNIVERSAL_PROJECT_TEMPLATE" "$root\01_ACTIVE_PROJECTS\$slug"
Set-Location "$root\01_ACTIVE_PROJECTS\$slug"
git init -b main
# Fill out CLAUDE.md, README.md, docs/product/PRD-v1.md
# Walk PROJECT_BOOTSTRAP_CHECKLIST.md
```

## Conventions

- One folder per project, kebab-case slug.
- Each project has its own git remote — `01_ACTIVE_PROJECTS/` is **not** committed in the workspace repo (see `.gitignore` if you want strict isolation).
- Per-project `CLAUDE.md` overrides workspace `CLAUDE.md`.

## When to graduate to `02_ARCHIVED_PROJECTS/`

- No commits for 6 months
- All users migrated off
- All data exported / deleted per retention policy
- Hand-off notes written in `docs/onboarding/SUNSET.md` inside the project

Move with:
```powershell
Move-Item "$root\01_ACTIVE_PROJECTS\$slug" "$root\02_ARCHIVED_PROJECTS\$slug"
```
Then append a one-line entry to `02_ARCHIVED_PROJECTS/README.md`.

## Active project index

> Update this table as you add projects.

| Project | Stage | Started | Owner | Notes |
|---------|-------|---------|-------|-------|
| _(none yet)_ | | | | |
