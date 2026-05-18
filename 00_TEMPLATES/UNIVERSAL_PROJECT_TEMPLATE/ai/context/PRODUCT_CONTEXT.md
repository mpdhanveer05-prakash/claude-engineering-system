# PRODUCT_CONTEXT.md

> The product-side context Claude needs to make good product decisions.

---

## 1. The Pitch

_{One paragraph: what we make, for whom, the value, the wedge.}_

## 2. Target Users

| Persona | Role | Top 3 jobs-to-be-done | Top 3 frustrations |
|---------|------|----------------------|---------------------|
| {Name} | {Title} | 1. ... 2. ... 3. ... | 1. ... 2. ... 3. ... |

## 3. Differentiation

| Competitor | What they do | Where they fall short | What we do differently |
|------------|--------------|------------------------|------------------------|
| | | | |

## 4. Business Model

- Pricing: {model}
- Plans: {free / pro / team / enterprise}
- Activation event: {what defines "activated user"}
- Revenue event: {what triggers a charge}
- Churn signal: {what predicts churn 30 days out}

## 5. North-Star Metric

| Metric | Target | Current | Owner |
|--------|--------|---------|-------|
| {NSM} | {goal} | {value} | {person} |

## 6. Guardrail Metrics

| Metric | Threshold | Why |
|--------|-----------|-----|
| Error rate | < 0.1% | Trust |
| p95 latency | < 300ms | UX |
| Support tickets / DAU | < 1% | Self-service |
| Free → paid conversion | > 3% | Unit economics |

## 7. Roadmap (high level)

| Quarter | Theme | Expected outcome |
|---------|-------|------------------|
| Q{N} | | |

> Detail lives in `planning/roadmap/ROADMAP.md`.

## 8. Brand & Voice

- Tone: {e.g., calm, precise, no exclamation marks}
- Forbidden words: {e.g., "leverage", "revolutionary", "seamless"}
- Tense: present, second person ("you")
- Reading level: target grade 8

## 9. Recent User Feedback (rolling)

| Date | Source | Verbatim / summary | Action taken |
|------|--------|---------------------|--------------|
| | | | |

> Keep 10 most recent; archive the rest to `planning/feedback-archive.md`.

## 10. Product Principles

1. _{example} Boring tech, surprising UX._
2. _{example} If the user has to read docs, we failed._
3. _{example} Reversible by default — every action has an undo._

---

*Update frequency: monthly or whenever positioning shifts.*
