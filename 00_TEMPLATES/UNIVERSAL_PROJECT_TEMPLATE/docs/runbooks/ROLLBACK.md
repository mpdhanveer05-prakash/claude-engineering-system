# ROLLBACK.md

> How to undo a bad deploy. Rehearse quarterly in staging.

---

## Pre-conditions

- You have access to the deploy console / CI.
- You know the previous-good tag (`git tag -l "v*" --sort=-v:refname | head`).
- You know whether the bad release had a forward-only migration.

## Decision Tree

```
Bad deploy detected
  ├── Migration ran?
  │     ├── No → Roll back code only (fast path)
  │     └── Yes → Is migration backwards-compatible with previous code?
  │             ├── Yes → Roll back code only
  │             └── No → Roll forward with fix; rollback risks data loss
  └── External side effect (charge sent, email delivered)?
        ├── No → Roll back
        └── Yes → Compensating action; do not naive-rollback
```

## Fast Path (Code-Only Rollback)

```bash
# Vercel
vercel rollback --token=$VERCEL_TOKEN

# Fly.io
fly releases --app {APP}        # find previous version
fly deploy --image registry.fly.io/{APP}:{previous-tag}

# Kubernetes
kubectl rollout undo deployment/{app} -n {ns}

# AWS ECS
aws ecs update-service --cluster {cluster} --service {svc} --task-definition {previous-rev}
```

## Migration Rollback (rare)

Only if migration was reversible AND data hasn't changed:

```bash
{migration_tool} down 1
```

If data has changed: write a forward fix; never naive-down on prod with writes.

## After Rollback

- [ ] Confirm error rate back to baseline
- [ ] Confirm critical flows on dashboards
- [ ] Update incident channel
- [ ] Update status page
- [ ] Open ticket: investigate root cause + add regression test before re-deploy

## Rehearsal Cadence

- Quarterly: rollback in staging from latest to N-1
- Annually: rollback through 3 versions (smoke for compatibility)
