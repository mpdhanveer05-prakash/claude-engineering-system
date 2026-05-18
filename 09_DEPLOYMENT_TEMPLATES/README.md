# 09_DEPLOYMENT_TEMPLATES

Provider-specific deployment recipes. Pick the one for your target.

| Folder | Best for |
|--------|----------|
| `aws/` | ECS Fargate, Lambda, EKS |
| `gcp/` | Cloud Run, GKE |
| `azure/` | Container Apps, AKS |
| `vercel/` | Next.js, edge functions |
| `kubernetes/` | Any K8s (cloud-neutral) |

Each folder contains:
- `DEPLOYMENT_GUIDE.md` — provider-specific recipe
- `manifests/` or `terraform/` — drop-in IaC
- `runbook.md` — operating the service on this provider

## Universal deploy principles
- Immutable artifacts (tagged container images)
- Healthcheck + readiness probes mandatory
- Zero-downtime rollout (rolling, blue-green, or canary)
- Rollback automated and rehearsed
- Secrets via cloud secret manager, never baked into image
- Auto-scaling configured with sane min/max
- Cost dashboard wired from day one
