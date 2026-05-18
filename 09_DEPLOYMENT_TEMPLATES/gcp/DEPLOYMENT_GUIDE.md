# GCP Deployment Guide

## Default targets
| Workload | Service |
|----------|---------|
| Container API | Cloud Run |
| Multi-service / K8s | GKE Autopilot |
| Postgres | Cloud SQL |
| Object storage | GCS |
| Secrets | Secret Manager |
| Auth-to-GCP from CI | Workload Identity Federation (OIDC) |
| DNS | Cloud DNS |
| CDN | Cloud CDN |

## Cloud Run baseline
- Min instances: 0 (or 1 if cold-start sensitive)
- Max instances: budgeted
- Concurrency: 80 default; tune per workload
- HTTPS only; custom domain via mapping
- VPC connector if it needs private network access
- Service account least-privilege per service

## GKE Autopilot
- Workload Identity for pod-to-GCP auth
- Binary authorization for image policy
- Network policy: default deny
- Backup with GKE Backup

## IAM
- Org policies for guardrails (allowed locations, public-access prevention)
- Folders per env, projects per workload
- Service accounts per service; no human keys
