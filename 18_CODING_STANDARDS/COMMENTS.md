# COMMENTS.md

## Default: write none.

Self-explanatory code beats comments. Add a comment only when the **why** is non-obvious from the code.

## Add a comment when

- A workaround for a known bug in a library — link to the issue.
- A non-obvious invariant the caller must uphold.
- A performance choice that looks wrong.
- A regulatory / compliance reason (e.g., "GDPR Art. 17 — hard delete").
- A piece of math that would take a reader >30s to derive.

## Never add a comment that

- Restates what the code does (`// increment i`)
- Describes the PR or ticket (`// fixes JIRA-123`) — that belongs in the commit/PR.
- Says "TODO" without an owner and a date — these rot. Either fix or open an issue and link to it.
- Says "removed for now" — actually remove it; git remembers.

## Docstrings

- Public APIs of libraries: yes — types, behavior, edge cases, examples.
- Private functions: no — clear name + signature is enough.
- React components: usage example if non-obvious.

## Formats

| Language | Format |
|----------|--------|
| TS/JS | JSDoc on exported APIs only |
| Python | Google or NumPy style; one-liner okay |
| Go | `// FunctionName ...` per convention |
| Rust | `///` doc comments with examples |

## Bad → Good

| Bad | Good |
|-----|------|
| `// Loop through users` | (delete it) |
| `// fix bug` | (delete it; commit message has context) |
| `// returns the user's name` (above `getUserName`) | (delete it) |
| `// HACK: bypass validation for legacy clients` | `// Legacy v1 clients send numeric IDs; coerce until v1 sunset on 2026-09-01. See ADR-0042.` |
