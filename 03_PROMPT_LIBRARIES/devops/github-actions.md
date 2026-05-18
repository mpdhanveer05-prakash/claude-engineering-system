# GitHub Actions Pipeline

**Goal:** Generate a CI/CD pipeline tailored to a project's stack.
**When to use:** New project, or when overhauling CI.
**Inputs:** stack (lang/framework), required jobs (lint/type/test/build/e2e/deploy), env matrix.
**Output shape:** One or more `.github/workflows/*.yml` files.
**Stop conditions:** No long-lived cloud credentials in workflow files; use OIDC.

---

Generate a GitHub Actions pipeline for this project.

Stack: {STACK}
Required jobs: {JOBS}
Environments: {ENVS}
Deploy target: {TARGET}

Rules:
- Use `concurrency` to cancel superseded runs per ref
- Cache language deps via the official action's `cache` input
- Set the minimum required permissions per job (`permissions: contents: read` baseline)
- Use OIDC for cloud auth (`permissions: id-token: write`) — never `AWS_SECRET_ACCESS_KEY`
- Pin actions by SHA for security-sensitive jobs; by version (`@v4`) for the rest
- Fail fast on `lint`, `type`, `test`; run `e2e` only after they pass
- Upload artifacts (coverage, test reports) and attach to PR
- Job names readable in the PR check list

Output: complete YAML, with brief comments above each job explaining its purpose.
