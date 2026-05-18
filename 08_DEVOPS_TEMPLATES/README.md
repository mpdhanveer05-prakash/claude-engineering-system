# 08_DEVOPS_TEMPLATES

Reusable IaC + container + script templates.

| File | Scope |
|------|-------|
| `Dockerfile.node` | Multi-stage Node.js build, distroless final |
| `Dockerfile.python` | Multi-stage Python build, distroless final |
| `docker-compose.dev.yml` | Postgres + Redis + MinIO for local dev |
| `terraform-module-skeleton/` | Conventions for new Terraform modules |
| `helm-chart-skeleton/` | Conventions for Helm charts |
| `pre-commit-config.yaml` | Format + lint + secret-scan hooks |

## Conventions
- All images: multi-stage, distroless final
- Non-root user in container
- Drop all capabilities, add only what's needed
- Pinned base image digests, not tags, in prod builds
- Healthcheck + readiness in compose/manifest
