# Threat Model

**Goal:** Produce a STRIDE-lite threat model for a service or major feature.
**When to use:** New service, new external surface, major architectural change.
**Inputs:** architecture diagram + data flows + asset list.
**Output shape:** Markdown per `docs/security/THREAT_MODEL.md` template.
**Stop conditions:** Don't speculate about attackers' motivations; focus on attack surface.

---

Produce a threat model for: {SUBJECT}

Use STRIDE per container:
- **S** poofing
- **T** ampering
- **R** epudiation
- **I** nformation disclosure
- **D** enial of service
- **E** levation of privilege

For each container, list:
- 2–4 threats relevant to this container
- Vector (how the attack happens)
- Existing mitigation (cite the control)
- Residual risk (Low/Medium/High)

Add an **Abuse Cases** section: at least 3 abuse cases with detection + response.

Add a **Open Risks** table for risks you'd accept, defer, or escalate.

Cite the file/control for each mitigation so a reviewer can verify.
