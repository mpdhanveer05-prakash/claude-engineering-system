# Generate Unit Tests

**Goal:** Cover a unit of business logic with focused, behavior-driven tests.
**When to use:** New module, untested module, before a refactor.
**Inputs:** target file path, framework.
**Output shape:** A `*.test.ts` (or equivalent) file co-located with the module.
**Stop conditions:** No mocking the framework. No 100%-coverage chasing. Test behavior, not implementation.

---

Write unit tests for `{FILE_PATH}`.

Framework: {FRAMEWORK}
Test conventions: see `tests/README.md` and `docs/standards/CODING_STANDARDS.md`.

Process:
1. Read the file. Identify the public surface (exported functions/classes).
2. For each export, list 3–7 behavior cases: happy path, edge cases, error cases.
3. Use factories from `tests/factories/`; never literal domain objects.
4. Test behavior — inputs and outputs — not internal state.
5. One logical assertion per test. Clear `describe` blocks per export.
6. No external I/O — extract or inject dependencies.

Output:
- Test file content
- A list of any cases you couldn't test because of a code smell (suggest the refactor; don't apply it)
- Coverage delta you expect
