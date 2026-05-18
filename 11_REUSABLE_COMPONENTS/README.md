# 11_REUSABLE_COMPONENTS

Cross-project component snippets. Copy in, adapt, ship.

| Folder | Stack |
|--------|-------|
| `ui-react/` | shadcn-style components (DataTable, EmptyState, EmptyCard, Spinner, Toast, ConfirmDialog) |
| `ui-rn/` | React Native equivalents |
| `domain/` | Cross-project domain helpers (Money, Email, UserId branded types) |
| `hooks-react/` | Cross-project hooks (useDebounce, useLocalStorage, useFeatureFlag) |

## Conventions
- Each component is **self-contained** in a file; no shared utility imports beyond the runtime.
- Each has a one-paragraph header comment: purpose, props, accessibility notes.
- Each has a story / example markdown file alongside.
- No project-specific copy text — hard-code placeholder, override via prop.

## Submission rules
- Promote a component here once it's been used in **two** projects.
- Demote / archive a component if it stops being used anywhere.
- Tag breaking changes with a comment at the top, never silently mutate.
