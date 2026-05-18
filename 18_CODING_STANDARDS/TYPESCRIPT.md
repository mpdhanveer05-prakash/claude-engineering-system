# TYPESCRIPT.md

## Config baseline
```json
{
  "compilerOptions": {
    "target": "ES2022",
    "module": "ESNext",
    "moduleResolution": "Bundler",
    "strict": true,
    "noUncheckedIndexedAccess": true,
    "noImplicitOverride": true,
    "exactOptionalPropertyTypes": true,
    "noFallthroughCasesInSwitch": true,
    "skipLibCheck": true,
    "isolatedModules": true
  }
}
```

## Rules
- **`any` is banned.** Use `unknown` + narrow.
- **No `as` casts** without a comment justifying it.
- **No `!` non-null assertions** outside tests; use a narrow.
- **Discriminated unions** for state: `{ status: 'idle' | 'loading' | 'success'; data?: T; error?: E }`.
- **Branded types** for IDs: `type UserId = string & { __brand: 'UserId' }`.
- **Zod / Valibot** for runtime validation; export inferred types.
- **Pure functions** for logic; React hooks only at the boundary.
- **No barrels** (`index.ts` re-exports) for tree-shaking; explicit imports.

## Errors
- Throw custom `Error` subclasses; never strings.
- For expected-failure flows, prefer `Result<T, E>` (e.g., `neverthrow`) over throwing.

## Async
- Always `await` or explicitly `void` a promise.
- Top-level await for module init only.
- `Promise.all` for parallel; never for-await over an array of HTTP calls.

## React (subset — see REACT.md)
- Function components only.
- Props typed inline or with `interface`; never `React.FC` (it adds children implicitly).
- Hooks at top of component, in fixed order.
- Effects: dependency array honest; if it lies, refactor.

## Style
- Single quotes
- Trailing commas
- Semicolons on
- Arrow functions for callbacks, function declarations for top-level
