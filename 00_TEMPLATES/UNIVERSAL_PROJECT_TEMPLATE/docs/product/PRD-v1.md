# PRD-v1.md — {Feature / Product Name}

> Product Requirements Document. One per product or major feature. Use `19_BUSINESS_REQUIREMENT_TEMPLATES/` for fuller forms.

---

| Field | Value |
|-------|-------|
| Author | |
| Reviewers | |
| Status | Draft / Reviewed / Approved / Built / Shipped |
| Target release | vX.Y.Z |
| Last updated | YYYY-MM-DD |

## 1. Problem

_What real pain are we solving? Who feels it? How often? How acutely?_

## 2. Users

| Persona | What they want | Today they... |
|---------|----------------|---------------|
| | | |

## 3. Goals

| # | Outcome | Metric | Target |
|---|---------|--------|--------|
| 1 | | | |

## 4. Non-Goals

What this PRD explicitly does **not** cover.

## 5. Stories

```
As a <persona>, I want <action>, so that <outcome>.
```

## 6. UX

- Wireframes: `docs/design/wireframes/{feature}/`
- Hi-fi: Figma link
- Key flows: list

## 7. Functional Requirements

| ID | Requirement | Priority (M/S/C/W) |
|----|-------------|--------------------|
| FR-1 | | M |

## 8. Non-Functional Requirements

| ID | Requirement | Priority |
|----|-------------|----------|
| NFR-1 | p95 latency < 200ms | M |
| NFR-2 | WCAG 2.2 AA | M |
| NFR-3 | i18n: en, es | S |

## 9. Constraints

- Tech: must reuse existing auth
- Time: ship by YYYY-MM-DD
- Budget: < $X/mo incremental infra

## 10. Risks

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| | | | |

## 11. Open Questions

- ...

## 12. Rollout Plan

- Behind flag `<flag-name>`, default off
- Internal dogfood: 1 week
- 5% → 25% → 100% over 2 weeks
- Success gate: NSM improves OR no regression on guardrails

## 13. Success Criteria

Quantitative, measurable, time-bound.
- _e.g._ Activation rate increases from 14% to 22% within 60 days of GA.

## 14. Appendix

- Research links
- Competitor analysis
- Prior art
