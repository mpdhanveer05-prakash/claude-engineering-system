# GLOBAL_PROMPT_LIBRARY.md

> Index of the cross-project reusable prompts in `03_PROMPT_LIBRARIES/`. Treat each prompt as a recipe — copy, tailor, run.

---

## How to Use This Library

1. Find the prompt that matches your goal.
2. Open the linked file under `03_PROMPT_LIBRARIES/<domain>/`.
3. Replace `{PLACEHOLDERS}` with project-specific values.
4. Paste into Claude (or save to project's `ai/prompts/`).

Each prompt file follows this skeleton:

```markdown
# <Prompt Name>
**Goal:** ...
**When to use:** ...
**Inputs:** ...
**Output shape:** ...
---
<prompt body>
```

---

## Architecture & Design

| Prompt | File | When |
|--------|------|------|
| System architecture from PRD | `architecture/system-from-prd.md` | New product |
| Component decomposition | `architecture/component-decomposition.md` | New feature |
| ADR drafting | `architecture/adr-draft.md` | Any cross-cutting decision |
| Microservice split | `architecture/microservice-split.md` | Scaling a monolith |
| Event-driven redesign | `architecture/event-driven-redesign.md` | Eventual consistency push |
| Multi-tenancy strategy | `architecture/multi-tenancy.md` | SaaS scale-up |

## Code Generation

| Prompt | File | When |
|--------|------|------|
| New REST endpoint | `code-generation/rest-endpoint.md` | Adding API surface |
| New React component | `code-generation/react-component.md` | UI work |
| New CLI command | `code-generation/cli-command.md` | Internal tooling |
| Background job | `code-generation/background-job.md` | Async work |
| Webhook receiver | `code-generation/webhook-receiver.md` | Integrations |

## Refactoring

| Prompt | File | When |
|--------|------|------|
| Extract module | `refactoring/extract-module.md` | File >500 LOC |
| Replace inheritance with composition | `refactoring/inheritance-to-composition.md` | Class hierarchies |
| Remove dead code | `refactoring/remove-dead-code.md` | Periodic cleanup |
| Tighten types | `refactoring/tighten-types.md` | After loose-types audit |

## Debugging

| Prompt | File | When |
|--------|------|------|
| Reproduce + isolate bug | `debugging/reproduce-isolate.md` | Bug intake |
| Root-cause analysis | `debugging/root-cause.md` | After repro |
| Add regression test | `debugging/add-regression-test.md` | Pre-fix |
| Production incident triage | `debugging/incident-triage.md` | Active incident |

## Security

| Prompt | File | When |
|--------|------|------|
| Threat model | `security/threat-model.md` | New service |
| Auth review | `security/auth-review.md` | Auth code change |
| Dependency vulnerability triage | `security/dep-vuln-triage.md` | Snyk/dependabot alert |
| Secret rotation runbook | `security/secret-rotation.md` | Quarterly |

## Performance

| Prompt | File | When |
|--------|------|------|
| Performance budget setup | `performance/budget-setup.md` | New project |
| Query plan analysis | `performance/query-plan.md` | Slow DB query |
| Frontend perf audit | `performance/frontend-audit.md` | Lighthouse regression |
| Load test plan | `performance/load-test-plan.md` | Pre-launch |

## Testing

| Prompt | File | When |
|--------|------|------|
| Test pyramid setup | `testing/pyramid-setup.md` | New project |
| Generate unit tests | `testing/unit-tests.md` | New module |
| Generate e2e tests | `testing/e2e-tests.md` | New user flow |
| Mutation testing review | `testing/mutation-review.md` | Coverage audit |

## Documentation

| Prompt | File | When |
|--------|------|------|
| Write README | `documentation/readme.md` | New repo |
| Write ADR | `documentation/adr.md` | Architectural decision |
| Write runbook | `documentation/runbook.md` | New service in prod |
| Write API reference | `documentation/api-reference.md` | API surface change |
| Write release notes | `documentation/release-notes.md` | Per release |

## DevOps

| Prompt | File | When |
|--------|------|------|
| Dockerfile from spec | `devops/dockerfile.md` | New service |
| GH Actions pipeline | `devops/github-actions.md` | New repo |
| Terraform module | `devops/terraform-module.md` | New infra |
| Kubernetes manifests | `devops/k8s-manifests.md` | K8s deploy |

## Database

| Prompt | File | When |
|--------|------|------|
| Schema design from PRD | `database/schema-from-prd.md` | New feature with state |
| Migration plan (zero-downtime) | `database/migration-plan.md` | Schema change |
| Indexing review | `database/indexing-review.md` | Slow query investigation |
| Data backfill script | `database/backfill-script.md` | Migration with backfill |

## UI/UX

| Prompt | File | When |
|--------|------|------|
| Component spec from Figma | `ui-ux/component-from-figma.md` | Design handoff |
| Accessibility audit | `ui-ux/a11y-audit.md` | Pre-launch |
| Design tokens from brand | `ui-ux/design-tokens.md` | New design system |

## Product

| Prompt | File | When |
|--------|------|------|
| PRD draft | `product/prd-draft.md` | New feature |
| User story breakdown | `product/user-story-breakdown.md` | Refining PRD |
| Risk register | `product/risk-register.md` | Project kickoff |

## Code Review

| Prompt | File | When |
|--------|------|------|
| Self-review checklist | `code-review/self-review.md` | Before opening PR |
| Senior reviewer mode | `code-review/senior-review.md` | Reviewing PR |
| Security-focused review | `code-review/security-review.md` | Auth/payment changes |

## Mobile

| Prompt | File | When |
|--------|------|------|
| iOS/Android parity check | `mobile/parity-check.md` | Cross-platform feature |
| App store metadata | `mobile/store-metadata.md` | Release |
| Offline-first design | `mobile/offline-first.md` | Connectivity-sensitive app |

---

## Authoring New Prompts

- Keep prompts short. Long prompts = lost context.
- Use **explicit placeholders** like `{PROJECT_NAME}`, `{STACK}`, `{FILE_PATH}`.
- Specify **output shape** (markdown? code only? table?).
- Include **stop conditions** ("don't ask follow-up questions, make a defensible guess and proceed").
- Test the prompt at least twice on real work before committing.
- Add a one-line entry to this index when you add a file.

---

*Update frequency: append-only. Only delete prompts that have actively misled.*
