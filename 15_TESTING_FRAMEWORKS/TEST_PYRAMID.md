# TEST_PYRAMID.md

## The pyramid (not a Christmas tree, not an ice-cream cone)

```
        /\
       /e2e\         5–30 flows
      /------\
     /contract\      tens
    /----------\
   /integration \    tens-hundreds
  /--------------\
 /     unit       \  hundreds-thousands
/__________________\
```

## What each tier is for

| Tier | Tests | Stubs |
|------|-------|-------|
| Unit | one module, no I/O | nothing — pure functions |
| Integration | one service end-to-end internally | external HTTP / queues stubbed |
| Contract | API consumer ↔ producer agreement | provider-side test, consumer-side fixture |
| E2E | real browser / API client against running stack | nothing external faked except payment |
| Performance | latency / throughput / capacity | real DB, synthetic load |

## When to add a tier
- New service → unit + integration + 1 e2e on first user flow
- New endpoint → integration test for happy + error paths
- New user flow → e2e
- New external contract → contract test on both sides
- New SLO → performance test that exercises it

## When NOT to add
- E2E for behavior already proven by integration
- Mocked unit tests that re-test the framework
- Snapshot tests of large objects (brittle, low signal)
- Tests that rely on time of day, network speed, or external state

## Anti-patterns
- **Ice-cream cone:** lots of e2e, few unit → slow CI, flaky, masks design problems
- **Hourglass:** unit + e2e, no integration → contract bugs survive
- **Coverage-driven:** chasing % over behavior → tests that prove the implementation, not the spec

## CI gating
- Unit + integration: every PR
- Contract: every PR (touching API)
- E2E: every merge to main
- Performance: weekly + before release
- Security negative tests: every PR
