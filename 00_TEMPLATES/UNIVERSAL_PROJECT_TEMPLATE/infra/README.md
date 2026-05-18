# infra/

Infrastructure-as-code and operational scripts.

```
infra/
├── terraform/     # IaC (one workspace per env: dev/staging/prod)
├── kubernetes/    # Manifests / Helm charts (if K8s)
├── docker/        # Dockerfiles, compose files
└── scripts/       # Ops scripts (db migrate, backup, restore, seed)
```

Rules:
- Terraform: one root module per environment; shared modules in `terraform/modules/`.
- State: remote backend (S3+DynamoDB / GCS / Terraform Cloud).
- Never `terraform apply` from a laptop in prod — CI only.
- Dockerfiles use multi-stage; final image distroless.
- Scripts idempotent; safe to rerun.
