# Self-Review Checklist

**Goal:** Catch issues *before* requesting human review.
**When to use:** Right before opening a PR.
**Inputs:** the diff and the task it's solving.
**Output shape:** Pass/fail per item with notes.

---

Self-review this diff. For each item, mark **pass** or **fail** and explain failures.

## Functional
- [ ] All acceptance criteria from the task are met
- [ ] Edge cases considered: empty, null, max, concurrency, multi-tenant
- [ ] Errors handled at boundaries; no silent catches
- [ ] No TODOs left without owner+date

## Tests
- [ ] New behavior has tests
- [ ] Bug fix has a regression test that fails without the fix
- [ ] All tests pass locally (lint + type + unit + integration)
- [ ] No skipped tests
- [ ] No flaky-looking tests (sleep, time-of-day, race-prone)

## Security
- [ ] Input validated
- [ ] Authz checked
- [ ] No secrets / PII added
- [ ] No new dependency with red flags

## Performance
- [ ] No N+1
- [ ] No unbounded loop / allocation
- [ ] Hot paths within budget

## Observability
- [ ] Logs added at lifecycle boundaries
- [ ] Errors go to error tracker with context
- [ ] Metrics updated if a new RED-meaningful path

## Docs
- [ ] API surface change → docs/api updated
- [ ] Schema change → docs/database updated
- [ ] User-visible change → CHANGELOG entry
- [ ] New service → runbook started

## Hygiene
- [ ] Conventional commit messages
- [ ] PR < 400 LOC or split rationale provided
- [ ] No unrelated changes
- [ ] No commented-out code

Report blockers, then ship.
