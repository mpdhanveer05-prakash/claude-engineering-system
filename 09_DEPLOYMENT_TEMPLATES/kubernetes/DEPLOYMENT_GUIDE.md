# Kubernetes Deployment Guide

## When to use
- Multi-service systems with cross-service networking
- Workloads needing fine-grained autoscaling
- Multi-region or on-prem deployments

## Minimum manifests
```
manifests/
├── deployment.yaml
├── service.yaml
├── ingress.yaml
├── hpa.yaml             # HorizontalPodAutoscaler
├── pdb.yaml             # PodDisruptionBudget
├── networkpolicy.yaml
├── configmap.yaml
├── externalsecret.yaml  # via External Secrets Operator
└── servicemonitor.yaml  # for Prometheus
```

## Required on every Deployment
- `resources.requests` + `resources.limits` (CPU + memory)
- `livenessProbe` + `readinessProbe` + `startupProbe`
- `securityContext`: non-root, read-only root FS, drop ALL caps
- `imagePullPolicy: IfNotPresent` (or `Always` only in dev)
- Tagged image (never `:latest` in prod)
- `topologySpreadConstraints` for HA
- Anti-affinity if running multiple replicas
- Graceful shutdown: `preStop` hook + `terminationGracePeriodSeconds`

## Networking
- Ingress with TLS via cert-manager + Let's Encrypt
- NetworkPolicy: default deny, then allow explicit
- mTLS via service mesh (Linkerd / Istio) for east-west

## Secrets
- External Secrets Operator → AWS SM / GCP SM / Vault
- Never `kubectl create secret` from a laptop in prod
- Mount as files; env vars only when unavoidable

## Rollout
- Deployment strategy: RollingUpdate, `maxSurge: 25%`, `maxUnavailable: 0`
- Or use Argo Rollouts for canary/blue-green
- Auto-rollback on failed readiness or alert trigger

## Observability
- Prometheus scrape via ServiceMonitor
- Logs via Fluent Bit → Loki/Cloud
- Traces via OTel Collector

## Cost
- Cluster autoscaler enabled
- Right-size requests after 2 weeks of metrics
- Spot/preemptible nodes for batch
