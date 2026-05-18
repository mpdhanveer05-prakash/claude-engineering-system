# CODING_STANDARDS.md — Project-Specific

> Project overlays of the workspace coding standards (`18_CODING_STANDARDS/`). Only put things here that differ from or specialize the global rules.

---

## 1. Language(s) & Versions

| Language | Version | Notes |
|----------|---------|-------|
| TypeScript | 5.5+ | strict |
| Python | 3.12 | mypy strict |

## 2. Style

- Formatter: {tool} with config in repo
- Lint: {tool} with config in repo
- Import order: external → internal → relative
- Single quotes (JS), double quotes (Python), per formatter

## 3. Naming (project specifics)

_(Reference workspace `18_CODING_STANDARDS/NAMING.md`; add overrides here only.)_

## 4. Project-specific patterns

- _e.g._ All use cases live in `src/use-cases/<domain>/<action>.ts` exporting a single function
- _e.g._ All repos extend `BaseRepo`; never inject ORM directly into use cases

## 5. Forbidden patterns

- _e.g._ No service locator
- _e.g._ No global mutable state
- _e.g._ No `console.log` (use logger)

## 6. Test patterns

- Co-located unit tests
- Use factories from `tests/factories/`, never literals for domain objects

## 7. PR Standards

- ≤400 LOC
- Description = task one-pager + screenshots/recordings for UI
- "Why" before "What"
- Self-review checklist completed
