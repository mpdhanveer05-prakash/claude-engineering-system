# 03_PROMPT_LIBRARIES

> Reusable prompts grouped by domain. Index at workspace root: `GLOBAL_PROMPT_LIBRARY.md`.

## How to use
1. Find the prompt domain folder for your task.
2. Open the prompt file.
3. Replace `{PLACEHOLDERS}` with your project specifics.
4. Paste into Claude (or save to project `ai/prompts/`).

## Authoring
Use this skeleton:

```markdown
# <Prompt Name>

**Goal:** <one sentence>
**When to use:** <trigger>
**Inputs:** <bulleted list of what you must provide>
**Output shape:** <markdown? code only? table?>
**Stop conditions:** <when to stop / what not to do>

---

<system / user prompt body, with {PLACEHOLDERS}>
```

## Quality bar
- Tested on real work at least twice
- Placeholders explicit
- Output shape specified
- ≤200 lines (split if larger)
