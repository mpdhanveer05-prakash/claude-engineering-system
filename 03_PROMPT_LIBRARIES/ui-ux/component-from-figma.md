# Component from Figma

**Goal:** Implement a Figma component as production code aligned with the design system.
**When to use:** Designer hands off a finished component.
**Inputs:** Figma URL (or node ID), target framework, design system path.
**Output shape:** Component file, story file, test file, type-safe props.
**Stop conditions:** Don't reinvent primitives that already exist; use the design system.

---

Implement this Figma component as code: {FIGMA_URL}

Framework: {FRAMEWORK}
Design system: {DESIGN_SYSTEM_PATH}

Process:
1. Fetch Figma node — extract layout, spacing, colors, typography, states.
2. Map Figma tokens to existing design tokens; flag any new tokens needed.
3. Identify reusable primitives from the design system; use them, don't recreate.
4. Implement:
   - Props typed (`interface` not `type` if extensible)
   - All states: default, hover, focus, disabled, error, loading
   - Keyboard-accessible (Enter/Space/Esc as semantic)
   - aria-* attributes correct for the role
5. Storybook story per state.
6. A11y test (axe) + visual regression test.
7. Update design system inventory if a new variant emerged.

Don't add styling not in the design. Flag any ambiguity instead of guessing.
