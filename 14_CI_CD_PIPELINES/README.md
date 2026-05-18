# 14_CI_CD_PIPELINES

Drop-in pipeline templates per provider. Each provider folder has stack-specific recipes.

| Folder | Templates |
|--------|-----------|
| `github-actions/` | Node + Python + Mobile + Deploy-on-tag |
| `gitlab-ci/` | Equivalent for GitLab |
| `circleci/` | Equivalent for CircleCI |

## Universal pipeline shape

```
PR open  → lint + type + unit + integration + build + preview deploy
PR merge → above + e2e + staging deploy + smoke
Tag      → above + manual approval + prod deploy + smoke + monitored rollout
```

## Required gates on PR
- Lint
- Type check
- Unit tests
- Integration tests (against a real DB)
- Build (catches type-only-pass-time errors)
- Secrets scan (`gitleaks`)
- Dependency vuln scan (Snyk/Dependabot)
- Bundle/image size check vs budget

## Required gates on merge
- All of the above + e2e
- Lighthouse CI for web apps
- a11y axe sweep
- License scan

## Deploy approval
- Staging: auto on merge
- Prod: tag + manual approval (UI button or `gh release create`)

## Secrets in CI
- OIDC to cloud (no long-lived keys)
- Repository secrets for vendor APIs
- Never echo secrets in logs (`::add-mask::` / equivalent)
