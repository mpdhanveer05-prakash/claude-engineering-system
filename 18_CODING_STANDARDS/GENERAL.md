# GENERAL.md — Cross-Language Coding Standards

## Principles
1. **Clarity over cleverness.** Future-you and future-Claude both read more than they write.
2. **Names that don't lie.** A `validateUser` that also creates the user is misnamed.
3. **One responsibility per unit.** A function does one thing; a module owns one concept.
4. **Pure functions for logic; side effects at boundaries.** Keep the core testable.
5. **Fail loudly at boundaries.** Trust internal callers; validate external input.
6. **Make impossible states unrepresentable.** Use the type system.
7. **Delete > deprecate > comment-out.** Dead code rots.
8. **Three-strikes rule for abstractions.** Wait for the third occurrence before extracting.
9. **Boring is best.** Prefer the standard library and proven patterns over novelty.

## File & module size
- Function: ≤ 50 lines; if longer, look for a missing abstraction
- File: ≤ 500 lines; if longer, split
- Class: ≤ 200 lines; if longer, look for a missing collaborator
- Module: cohesive — one concept per module folder

## Errors
- Throw typed errors with context, never strings
- Catch only where you can do something useful (recover, retranslate, log + re-raise)
- Never swallow errors silently — no empty catches
- Error messages: actionable for the reader at that layer

## Control flow
- Early return > nested if
- Prefer pattern matching / switch on tagged unions over runtime type checks
- No magic booleans — name parameters or use enums

## State
- Prefer immutability — clone over mutate when in doubt
- Localize state — closest to where it's used
- Avoid global state; if needed, make it explicit + injectable

## Concurrency
- Async by default for I/O; sync for CPU-bound
- Mark functions that can fail explicitly (`Result`, `Option`, typed exceptions)
- Cancellation: respect cancel tokens / signals everywhere

## Performance
- Profile before optimizing
- Algorithmic wins > micro-optimization
- Document Big-O on non-obvious hot paths

## Logging
- Structured, not interpolated
- Log events, not narratives
- No PII in logs

## Tests
- Test the behavior, not the implementation
- One assertion per test (or one logical assertion)
- Use factories, not literals, for domain objects
- Tests run in any order; no shared mutable state
