# System Architecture from PRD

**Goal:** Turn a PRD into a defensible system architecture draft.
**When to use:** New product or major feature with cross-cutting structural impact.
**Inputs:**
- The PRD content
- Existing system context (link to `docs/architecture/SYSTEM_ARCHITECTURE.md` if any)
- Constraints (latency, scale, compliance, budget)
**Output shape:**
- An ADR draft (use `ADR-TEMPLATE.md`)
- Container diagram (Mermaid)
- Open questions list
**Stop conditions:**
- Do not pick technologies you don't know first-hand
- Do not propose changes outside scope of the PRD
- If a critical constraint is missing, ask once, then proceed with a stated assumption

---

You are a Senior Staff Engineer. Read the following PRD and produce an architecture proposal.

**PRD:**
```
{PRD_CONTENT}
```

**Existing system context (if any):**
```
{EXISTING_CONTEXT}
```

**Constraints:**
{CONSTRAINTS}

Produce:

1. **Architecture summary** (1 paragraph, plain language)
2. **Container diagram** (Mermaid `graph LR` or `C4Container`)
3. **Component breakdown** — for each new container: tech, why this tech, deploy target, owner
4. **Data flow** — sequence diagram for the primary user journey
5. **Quality attribute table** — availability, latency, security, cost (estimated)
6. **Risks** — top 5, ranked, with mitigation
7. **Open questions** — list of decisions you can't make without more input
8. **ADR drafts** — at least one ADR per cross-cutting choice (auth, data, sync vs async, etc.) using the template at `docs/architecture/decisions/ADR-TEMPLATE.md`

Be specific. Avoid generic words ("scalable", "robust"). Cite the concrete reason each choice is right *for this PRD*.
