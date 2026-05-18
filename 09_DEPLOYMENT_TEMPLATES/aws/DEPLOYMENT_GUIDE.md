# AWS Deployment Guide

## Default targets
| Workload | Service |
|----------|---------|
| Container API / worker | ECS Fargate |
| Static + edge | S3 + CloudFront |
| Postgres | RDS or Aurora |
| Redis | ElastiCache |
| Object storage | S3 with versioning + lifecycle |
| DNS | Route 53 |
| Secrets | AWS Secrets Manager |
| Auth-to-AWS from CI | OIDC role assumption (no long-lived keys) |

## Account structure
- One AWS account per environment (`dev`, `staging`, `prod`)
- AWS Organizations + SCP for guardrails
- Centralized logs + billing accounts

## Network
- VPC per env; private subnets for app + DB
- NAT in each AZ for HA (or VPC endpoints to save cost)
- Security groups least-privilege; tag everything

## ECS Fargate baseline
- Service with circuit breaker
- ALB → target group → service
- Auto-scaling on CPU + request count
- Spot capacity for non-critical workloads
- Container Insights enabled

## IAM
- One role per task definition
- No `*` resources in prod policies
- Use IAM Identity Center for human access; STS for CI

## Backups + DR
- RDS automated backups (35 days)
- Cross-region copy for prod DB
- Point-in-time recovery tested quarterly

## Cost
- Compute Savings Plans for steady workloads
- Budget alerts at 50/80/100% per month per account
- Tagging enforced via SCP
