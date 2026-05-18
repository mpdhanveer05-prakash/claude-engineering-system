# Write Runbook

**Goal:** A runbook a pager-woken engineer can follow at 3 AM.
**When to use:** Any new service entering production, any new failure mode observed.
**Inputs:** the operation/failure mode, current diagnostic + recovery steps.
**Output shape:** Markdown runbook.
**Stop conditions:** Don't fictionalize commands; verify or mark as "needs verification".

---

Write a runbook for: {SCENARIO}

Use this skeleton:

```markdown
# <Runbook Title>

> When to use this runbook (one sentence)

## Severity & response time

## First 5 minutes
1. Acknowledge page
2. Open incident channel
3. Check: <specific dashboard or query>
4. ...

## Diagnose
- Hypothesis 1: <symptom-to-cause map> → check <specific thing>
- Hypothesis 2: ...

## Recover
- Option A — <action>: <exact command(s)>
- Option B — <action>: <exact command(s)>
- Last resort: <action>

## Verify recovery
- ...

## Communicate
- Status page: <template>
- Internal: <channel>
- Customer: <when, what>

## After
- [ ] Postmortem within 5 business days
- [ ] Add prevention to `ai/memory/gotchas.md`
```

Concrete commands only; if you don't know the exact command, mark `# TODO: verify command`.
