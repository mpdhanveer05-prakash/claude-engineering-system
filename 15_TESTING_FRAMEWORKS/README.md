# 15_TESTING_FRAMEWORKS

Test pyramid + fixture conventions per stack.

| File | Scope |
|------|-------|
| `TEST_PYRAMID.md` | Universal pyramid + ratios + when to add each tier |
| `PLAYWRIGHT.md` | E2E setup, fixtures, a11y, CI |
| `VITEST.md` | Unit / integration setup |
| `PYTEST.md` | Unit / integration setup |
| `K6.md` | Load testing setup |
| `FUZZING.md` | Property + fuzz testing approach |
| `MUTATION.md` | Mutation testing for coverage audits |

## Pyramid targets (sane defaults)

| Tier | Target count | Runtime budget |
|------|--------------|----------------|
| Unit | hundreds-thousands | ≤30s full suite |
| Integration | tens-hundreds | ≤2min full suite |
| Contract | tens | ≤30s |
| E2E | 5–30 critical flows | ≤10min full suite |
| Performance | per critical path | gated, not on every PR |
| Security (negative) | per auth/authz path | included in integration |

## Test data
- Factories live in `tests/factories/`
- No literal domain objects in test bodies
- Time mocked with a single utility (one source of "now")
- Random seeded for reproducibility
