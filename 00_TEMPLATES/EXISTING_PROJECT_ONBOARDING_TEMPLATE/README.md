# EXISTING_PROJECT_ONBOARDING_TEMPLATE

> Drop-in folder set for an **existing** codebase. Copy this *into* a legacy repo to start adding Claude context without restructuring anything.

## What this template adds
Just two folders:
```
ai/                        # full subtree from UNIVERSAL_PROJECT_TEMPLATE/ai/
docs/onboarding/           # codebase snapshot, tech-debt register, risk hotspots
```

Plus two files at the root:
```
CLAUDE.md                  # written AFTER walking the onboarding guide
.claude/settings.json      # read-only-first permission set
```

## Bootstrap

```powershell
$src  = "C:\Users\dhanveerp\Documents\Claude Pro Max\00_TEMPLATES\UNIVERSAL_PROJECT_TEMPLATE"
$dst  = "<path-to-existing-repo>"
Copy-Item -Recurse "$src\ai" $dst
New-Item -ItemType Directory -Force "$dst\docs\onboarding" | Out-Null
Copy-Item "$src\.claude\settings.json" "$dst\.claude\settings.json"
# Do NOT copy the root CLAUDE.md — write it from scratch after Phase 11 of PROJECT_ONBOARDING_GUIDE.md.
```

## Then follow
`../../PROJECT_ONBOARDING_GUIDE.md` step by step.
