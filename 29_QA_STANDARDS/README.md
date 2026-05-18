# 29_QA_STANDARDS

| File | Scope |
|------|-------|
| `QA_GATES.md` | Per-stage quality gates (PR / merge / release) |
| `BUG_TRIAGE.md` | How bugs flow from intake to fix to verify |
| `EXPLORATORY.md` | Charter-driven exploratory testing |
| `REGRESSION_POLICY.md` | What we promise won't break |
| `ACCESSIBILITY.md` | WCAG 2.2 AA verification process |
| `RELEASE_QA_CHECKLIST.md` | Pre-tag manual sweep |

## QA philosophy

- **Quality is everyone's job; QA leads it, doesn't own it.**
- **Automated gates first; humans for what humans are uniquely good at** (exploratory, usability, edge of the spec).
- **Bugs are signal.** A repeat bug class is a missing test, a missing type, or a missing rule.
- **Never disable a test to ship.** Either fix it or quarantine it (with an issue + a date).
