# Frontend Performance Audit

**Goal:** Identify and prioritize frontend performance wins.
**When to use:** Lighthouse regression, customer report, pre-launch.
**Inputs:** target URL(s), current Lighthouse / WebPageTest numbers, performance budget.
**Output shape:** Ranked list of fixes with estimated impact.
**Stop conditions:** Don't propose >5 fixes; rank ruthlessly.

---

Audit the frontend performance of {URLS}.

Current state:
- LCP: {LCP}
- INP: {INP}
- CLS: {CLS}
- TBT: {TBT}
- Bundle size: {BUNDLE_SIZE}
- Budget: {BUDGET}

Process:
1. Inspect bundle (largest chunks, duplicate deps).
2. Inspect critical render path (blocking resources, hydration cost).
3. Inspect images (sizes, formats, lazy-load eligibility).
4. Inspect 3rd-party scripts (cost + necessity).
5. Inspect server response time + cache headers.

Output table:

| # | Fix | Expected metric impact | Effort (S/M/L) | Risk | Code pointer |
|---|-----|------------------------|----------------|------|--------------|

Rank by (impact / effort). Cap at 5. For each, explain *why* it helps.
