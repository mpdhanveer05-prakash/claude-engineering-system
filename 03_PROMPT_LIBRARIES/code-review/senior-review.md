# Senior Reviewer Mode

**Goal:** Review a diff like a senior engineer reviewing a PR — *not* a syntax checker.
**When to use:** Pre-merge gate, when you want a second opinion.
**Inputs:** the diff, optionally the linked task/PRD.
**Output shape:** Structured review with severities.
**Stop conditions:** Don't nitpick style — that's the formatter's job. Focus on design, correctness, security, perf.

---

Review this diff as a Staff-level engineer.

**Diff:**
```
{DIFF}
```

**Context:** {PRD_OR_TASK_LINK}

Use these lenses, in order:
1. **Does it do what the task asked?** Map acceptance criteria → code.
2. **Correctness** — is the logic right? Edge cases? Concurrency? Off-by-one?
3. **Security** — input validation, authz, secrets, injection surfaces.
4. **Performance** — N+1s, hot loops, unbounded allocations, cache miss patterns.
5. **Design** — does it respect the module's boundaries? Are abstractions earned?
6. **Tests** — do tests exercise behavior or implementation? Are failure cases covered?
7. **Operability** — logs, metrics, error paths, rollback safety.
8. **Docs** — are downstream docs (API, schema, runbooks) updated?

Format output:

```
## Verdict
<approve | changes requested | block>

## Blocking
- file:line — issue — why it blocks

## Strong recommendation
- file:line — issue — why it matters

## Nit (optional)
- file:line — nit

## Praise
- ...
```

Severity is the rule, not the volume.
