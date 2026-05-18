# COMMITS.md — Conventional Commits

## Format
```
<type>(<scope>): <subject>

<body>

<footer>
```

## Types
| Type | Use |
|------|-----|
| `feat` | New user-visible feature |
| `fix` | Bug fix |
| `refactor` | Non-behavioral code change |
| `perf` | Performance improvement |
| `docs` | Docs only |
| `test` | Tests only |
| `chore` | Build, deps, tooling |
| `ci` | CI config |
| `style` | Formatting only |
| `revert` | Revert a prior commit (auto-generated is fine) |
| `build` | Build system / packaging |

## Subject rules
- ≤72 chars
- Imperative ("add", not "added")
- Lowercase first letter
- No trailing period

## Body
- Optional; required when the "why" isn't obvious from the diff
- Wrap at 72 chars
- Explain *why* and *what's different now* — not what the code does

## Footer
- `BREAKING CHANGE: <description>` for breaking
- `Refs: PROJ-123` / `Closes: #456` for tracker links
- `Co-Authored-By: Name <email>` for pairing / AI assistance

## Examples
```
feat(billing): support proration on plan downgrade

Customers downgrading mid-cycle now get a prorated credit applied
to their next invoice. Previously the downgrade took effect at
period end, which surprised users who expected immediate change.

Refs: PROJ-431
```

```
fix(auth): clear refresh cookie on logout

The refresh cookie persisted after logout, allowing token rotation
to silently re-establish a session. Now logout invalidates both
access and refresh.

Co-Authored-By: Claude Opus 4.7 <noreply@anthropic.com>
```

## Squash merge titles
Apply the same format to the final squash commit title and body. The PR description usually becomes the squash body — write it accordingly.
