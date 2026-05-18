# ADR Draft

**Goal:** Produce an ADR for a cross-cutting decision.
**When to use:** Any decision that affects >1 module or is hard to reverse.
**Inputs:** the decision question, ≥2 candidate options, constraints, evidence.
**Output shape:** Markdown ADR per `ADR-TEMPLATE.md`.
**Stop conditions:** Don't decide; *propose*. Status: `Proposed`.

---

Write an ADR for the following decision.

**Question:** {QUESTION}

**Options considered:** {OPTIONS}

**Constraints:** {CONSTRAINTS}

**Evidence collected so far:** {EVIDENCE}

Follow `docs/architecture/decisions/ADR-TEMPLATE.md` exactly. For each option include pros, cons, cost, and reversibility. Recommend one. Be explicit about which option you'd pick today and which you'd pick if a single constraint changed.
