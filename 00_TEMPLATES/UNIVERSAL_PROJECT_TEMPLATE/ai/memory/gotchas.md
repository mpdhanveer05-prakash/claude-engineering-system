# gotchas.md

> The "I will never forget this again" file. Bugs whose root cause was non-obvious, libraries that misbehave, infra footguns. Each entry must cost less to read than the bug cost to find.

---

## Template

```markdown
## <One-line surprise>
**Discovered:** YYYY-MM-DD
**Cost:** {how long it took to debug} / {customer impact if any}
**Root cause:** <one paragraph>
**Fix:** <one paragraph, link to PR>
**Prevention:** <what we changed so this never happens again — link to test or lint rule>
**Trigger word:** <keyword that should make you remember this>
```

---

## Sentinel example (delete once first real entry added)

## `Date.now()` and DB `NOW()` drift by seconds across regions
**Discovered:** YYYY-MM-DD
**Cost:** 4h debugging session, no customer impact
**Root cause:** App server and DB server NTP drift; "created before" comparisons misfired.
**Fix:** Always compare timestamps in the DB or use the DB's clock for "now" — PR #142.
**Prevention:** Lint rule banning `Date.now()` in queries; integration test in CI.
**Trigger word:** "timestamp", "compare time"
