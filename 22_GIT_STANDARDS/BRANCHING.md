# BRANCHING.md

## Model: Trunk-Based with Short-Lived Branches

- `main` is always deployable.
- All work happens on short-lived branches (≤2 days ideal, ≤5 days max).
- Squash merge into `main`.
- Linear history; no merge commits.

## Branch naming

```
<type>/<short-slug>
<type>/<ticket-id>-<short-slug>
```

Types: `feature`, `fix`, `chore`, `refactor`, `docs`, `test`, `perf`, `experiment`.

Examples:
- `feature/billing-portal`
- `fix/PROJ-432-login-redirect`
- `refactor/use-cases-extraction`

## Protected branches

- `main`: PR required, status checks required, linear history enforced, no force-push, signed commits preferred.
- Tag-protected: only the release workflow can create `v*` tags.

## Long-lived branches (rare)

Only when truly necessary:
- `release/x.y` — for an LTS release line you're back-porting fixes to.
- `experiment/<name>` — for spikes that may not merge.

Even then: keep them rebased on `main` and resolve drift weekly.

## Hotfixes

- Branch from latest production tag: `git checkout -b fix/<slug> v1.4.2`
- Cherry-pick or apply fix.
- Tag `v1.4.3`.
- Forward-port to `main` immediately.
