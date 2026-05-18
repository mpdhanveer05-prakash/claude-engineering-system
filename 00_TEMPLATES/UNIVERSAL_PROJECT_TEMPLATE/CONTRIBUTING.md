# CONTRIBUTING.md

## Dev setup
See `README.md` → Quick Start. Required tools listed in `docs/onboarding/NEW_DEV_DAY_1.md`.

## Branching
- `main` is protected, always deployable
- Feature branches: `feature/<slug>`
- Fixes: `fix/<slug>`
- Chores: `chore/<slug>`
- Refactors: `refactor/<slug>`

## Commits
Conventional commits:
```
<type>(<scope>): <subject>

<body — why, not what>

<footer — refs, breaking notes>
```
Types: `feat | fix | chore | refactor | docs | test | perf | build | ci | style | revert`

## PR rules
- Keep <400 LOC; if larger, explain in the description
- Self-review checklist in `03_PROMPT_LIBRARIES/code-review/self-review.md`
- Required checks: lint, type, unit, integration, build, e2e (smoke)
- At least 1 reviewer; security-touching PRs need 2

## Tests
- Add a regression test with every bug fix
- New API endpoints: unit + integration
- New user flows: e2e
- Run locally before pushing: `{test_cmd}`

## Style
See `docs/standards/CODING_STANDARDS.md` and project `CLAUDE.md`.

## Releases
- Tag `vX.Y.Z` on `main`
- Auto-deploys to prod after manual approval
- Update `CHANGELOG.md` + `docs/releases/`
