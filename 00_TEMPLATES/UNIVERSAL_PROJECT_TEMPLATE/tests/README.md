# tests/

Test pyramid:

```
tests/
├── unit/           # fast, isolated, in-process
├── integration/    # real DB, real HTTP, controlled fixtures
├── e2e/            # full stack via browser/API (Playwright)
├── performance/    # load + benchmark (k6 / artillery / locust)
├── security/       # auth/authz negative tests, fuzz
├── smoke/          # post-deploy minimal flows
└── factories/      # test data builders
```

Conventions:
- Co-located **unit** tests next to source (`foo.ts` + `foo.test.ts`); this folder holds the higher tiers.
- One e2e per critical user flow.
- All bug fixes ship with a failing-first regression test.
- No skipped tests in `main` — delete or fix.
- Test data via factories, never literals for domain objects.
