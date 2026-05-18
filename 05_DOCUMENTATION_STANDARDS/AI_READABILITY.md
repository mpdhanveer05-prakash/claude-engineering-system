# AI_READABILITY.md — Writing Docs Claude Can Actually Use

## The principle
Claude reads top-to-bottom, in order, with a finite context. Structure docs so the *most-important* facts are *earliest* and *easiest to skim*.

## Structure
1. **Title** (`#`) — what this is.
2. **One-line summary** (blockquote) — purpose in one sentence.
3. **TOC** for docs >500 lines.
4. **Sections numbered** (`## 1.`, `## 2.`) so they can be referenced unambiguously.
5. **Tables** for any "X vs Y" or "field → meaning" — Claude reads tables well.
6. **Code fences** with language tags — Claude uses these to detect intent.
7. **Update frequency footer** so Claude can judge staleness.

## Anti-patterns
- Long unstructured prose — split into sections.
- Implicit references ("as mentioned above") — repeat the fact or link.
- Pictures-only diagrams (PNG/JPG) — use Mermaid so Claude can read them.
- Marketing language ("powerful", "seamless") — replace with specifics.
- "TODO" without ownership/date — rots, misleads.
- Hidden requirements buried in a 5-level nested list — promote them.

## Patterns Claude exploits
- **Frontmatter** at the top with stable fields (date, owner, status) — Claude reads this first.
- **Numbered checklists** for procedures.
- **Tables with consistent column headers** across similar docs.
- **Inline `code` references** to symbols, paths, env vars.
- **Cross-links as relative paths** (`../api/API_REFERENCE.md`) — Claude can follow.

## Frontmatter convention
```markdown
---
title: <Doc title>
owner: <person or team>
status: draft | review | accepted | deprecated
last_updated: YYYY-MM-DD
update_frequency: per-change | weekly | monthly | quarterly
applies_to: <project | service | module>
---
```

## File size
- **<200 lines** = ideal, fits in a glance.
- **200–500 lines** = ok, use a TOC.
- **500–1000 lines** = split.
- **>1000 lines** = always split.

See `FILE_SIZE_GUIDE.md` for the splitting heuristic.

## Diagrams
- Use **Mermaid** for everything Mermaid supports (flows, sequences, ER, C4, state).
- Use **draw.io** or **Excalidraw** only when Mermaid can't.
- Source files committed; PNG exports allowed as well for quick view.
- Always have a text legend below — Claude can't always read images, and humans skim them.

## Tables Claude likes

| Field | Description | Required | Notes |
|-------|-------------|----------|-------|
| `id` | Unique identifier | yes | UUID v7 |
| `name` | Human-readable | yes | ≤ 80 chars |

> Three columns minimum, four ideal. Single-column tables are noise; merge them into prose or lists.
