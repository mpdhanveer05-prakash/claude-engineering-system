# Rollout Checklist — vX.Y.Z

> Walk this within 24h of intended release. Skip = ship anyway = pain later.

## T-7 days
- [ ] Release notes drafted
- [ ] Breaking changes communicated to affected customers
- [ ] Migration runbook published
- [ ] Cross-team awareness (support, sales, success)

## T-1 day
- [ ] CI green on `main`
- [ ] Staging smoke passing
- [ ] Rollback rehearsed in staging (within last 14 days)
- [ ] On-call notified
- [ ] Status page banner ready (if user-visible)

## T-0 (deploy)
- [ ] Tag created (`git tag -s vX.Y.Z -m "..."`)
- [ ] Pipeline started
- [ ] Manual approval given
- [ ] Migrations applied (if any)
- [ ] Application deploy completed
- [ ] Post-deploy smoke passing
- [ ] Canary cohort enabled
- [ ] Dashboards green for 30 min

## T+1h
- [ ] Error rate within tolerance
- [ ] Latency within tolerance
- [ ] No SEV2+ in incident channel
- [ ] Expand cohort

## T+24h
- [ ] All cohorts enabled or rollout paused
- [ ] No new errors detected from this release
- [ ] Customer comms sent

## T+7d
- [ ] Post-launch review scheduled
- [ ] Old feature path scheduled for removal (if applicable)
- [ ] Memory updates: `ai/memory/gotchas.md` if anything surprised us

## If rollout pauses
1. Hold on cohort expansion
2. Investigate, fix-forward or rollback
3. Resume only after green for 30 min
4. Document in `planning/bugs/` if relevant
