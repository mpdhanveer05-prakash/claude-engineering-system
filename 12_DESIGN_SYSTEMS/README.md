# 12_DESIGN_SYSTEMS

Design tokens, component inventories, brand assets — workspace level. A project may consume these or define its own at `docs/design/`.

## Layout
```
12_DESIGN_SYSTEMS/
├── README.md
├── tokens/
│   ├── core.json        # primitives (colors, spacing, typography scales)
│   ├── semantic.json    # role-based aliases (success, danger, etc.)
│   └── component.json   # per-component overrides
├── inventory/
│   ├── COMPONENTS.md    # canonical list with status
│   └── icons.svg        # icon sprite
└── brand/
    ├── LOGO_GUIDELINES.md
    ├── COLOR_GUIDELINES.md
    └── TYPOGRAPHY.md
```

## Token format
Style Dictionary / Design Tokens W3C format. Generated outputs (CSS variables, Tailwind config, RN tokens, Flutter tokens) go in each project's build pipeline.

## Promotion rules
- A component graduates from project to workspace when used in 2+ projects.
- A token graduates when applied to 2+ component variants.

## Accessibility minimum
- 4.5:1 contrast for text
- 3:1 for large text and UI components
- Focus state visible on every interactive token
- Motion tokens respect `prefers-reduced-motion`
