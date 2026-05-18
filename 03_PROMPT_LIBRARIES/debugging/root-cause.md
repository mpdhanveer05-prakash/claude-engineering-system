# Root Cause Analysis

**Goal:** Diagnose a bug to its root cause, not its symptom.
**When to use:** After a reproducible bug is confirmed.
**Inputs:**
- Repro steps
- Logs / traces
- Affected code paths
**Output shape:** Markdown — symptom, contributing factors, root cause, blast radius, fix proposal, prevention idea.
**Stop conditions:** Don't propose a fix that "probably" works. Reproduce the root cause first or say you can't.

---

Diagnose this bug to root cause.

**Repro:**
```
{REPRO_STEPS}
```

**Evidence:**
- Logs: {LOG_LINKS}
- Trace: {TRACE_LINK}
- Affected files: {FILES}

Process:
1. **Confirm repro** — can you trigger it deterministically?
2. **Trace the actual code path** taken — read the files; don't guess.
3. **Identify the divergence** — where does intent diverge from behavior?
4. **5 whys** — keep asking why until you hit an invariant violation, missing check, or hidden assumption.
5. **Blast radius** — who else is affected? Same bug class elsewhere? Cross-tenant impact?
6. **Propose a fix** — minimal, surgical.
7. **Propose a prevention** — test, lint rule, type narrowing, comment in `ai/memory/gotchas.md`.

Output strictly:
- **Symptom:**
- **Root cause:**
- **Blast radius:**
- **Proposed fix:** (file:lines)
- **Regression test:** (file)
- **Prevention:** (one of: test / lint / type / memory entry / runbook)
