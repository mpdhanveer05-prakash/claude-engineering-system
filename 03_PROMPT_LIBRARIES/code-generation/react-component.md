# New React Component

**Goal:** Create a production-quality React component aligned with the design system.
**When to use:** New UI element that doesn't already exist in the design system.
**Inputs:** purpose, props, states, accessibility requirements.
**Output shape:** Component file + story + test, no surprises.
**Stop conditions:** No new dependencies. No global CSS. No emoji.

---

Create a React component for: {PURPOSE}

Props: {PROPS}
States: {STATES}
A11y: must be keyboard navigable and screen-reader announced

Process:
1. Check if a primitive in the design system already covers this; if yes, suggest using it instead.
2. Choose: server component (default) vs client component (only if it needs `useState`/`useEffect`/event handlers).
3. Implement using Tailwind utilities; component-scoped only if utilities can't express it.
4. Props typed via `interface`; default values via destructuring defaults.
5. All interactive states: default, hover, focus, focus-visible, active, disabled, loading, error.
6. ARIA attributes correct for the semantic role.
7. Storybook story per state (`*.stories.tsx`).
8. Unit test for behavior; axe test for a11y; visual snapshot.

Output: component file, story, test, and a one-line entry to add to the design system inventory.
