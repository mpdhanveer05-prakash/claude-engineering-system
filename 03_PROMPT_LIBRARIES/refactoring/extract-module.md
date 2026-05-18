# Extract Module

**Goal:** Pull a coherent concept out of a sprawling file/module into its own.
**When to use:** A file >500 LOC OR a single file holds two concepts.
**Inputs:** the file path, the concept to extract.
**Output shape:** mechanical, behavior-preserving series of commits.
**Stop conditions:** Never mix refactor with behavior change. If you find a bug, surface it, don't fix it here.

---

Extract `{CONCEPT}` from `{SOURCE_FILE}` into its own module.

Process:
1. **Identify** all symbols (functions, types, constants) that belong to the concept.
2. **Confirm** there are no behavior changes intended.
3. **Verify** test coverage of the affected surface. If insufficient, write tests first; do not refactor blind.
4. **Move** symbols to `{TARGET_FILE}` in one commit.
5. **Update imports** in the original file in the next commit.
6. **Run** lint, type, tests after each commit.
7. **Report**: files touched, public API changes (should be none), open questions.

If during extraction you spot a bug or smell unrelated to the concept, do NOT fix it. Note it for follow-up.
