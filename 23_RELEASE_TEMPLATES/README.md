# 23_RELEASE_TEMPLATES

| File | When |
|------|------|
| `RELEASE_NOTES.md` | Per release, customer-facing |
| `CHANGELOG_ENTRY.md` | Engineer-facing changelog line |
| `ROLLOUT_CHECKLIST.md` | Pre-deploy gate |
| `CUSTOMER_EMAIL.md` | Email to customers on user-visible change |
| `STATUS_PAGE_TEMPLATE.md` | Status page incident copy |
| `POSTLAUNCH_REVIEW.md` | 14 days after GA |

## Versioning policy
- Libraries: **SemVer** (`MAJOR.MINOR.PATCH`)
- Apps: **CalVer** (`YYYY.MM.PATCH`) is allowed when app has no public API
- Tags always `vX.Y.Z` (with `v` prefix)

## Communication ladder
| Change type | CHANGELOG | Release notes | Email | In-app | Status page |
|-------------|-----------|---------------|-------|--------|-------------|
| Bug fix (silent) | ✓ | ✓ if user-visible | — | — | — |
| Feature (small) | ✓ | ✓ | — | ✓ | — |
| Feature (big) | ✓ | ✓ | ✓ | ✓ | — |
| Breaking change | ✓ | ✓ | ✓ T-30 + T-0 | ✓ | — |
| Outage | — | — | ✓ post | — | ✓ |
