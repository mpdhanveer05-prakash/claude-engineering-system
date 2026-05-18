# Release Notes from Commits

**Goal:** Customer-facing release notes drafted from the commit log.
**When to use:** Before tagging a release.
**Inputs:** the range of commits to summarize, target audience (customers / internal / both).
**Output shape:** Markdown per the project's release notes template (`23_RELEASE_TEMPLATES/RELEASE_NOTES.md`).
**Stop conditions:** No marketing language; concrete user-visible changes only.

---

Draft release notes for {VERSION}.

Process:
1. Read commits since {PREVIOUS_TAG}.
2. Group by: Added / Improved / Fixed / Breaking / Deprecated / Removed / Security.
3. Translate engineering language to customer language — "fixed regex bug" → "fixed: search results sometimes missing items with apostrophes".
4. Skip internal-only changes (refactors, CI, deps) unless they affect customers.
5. Highlight 2–3 items at the top.
6. List **Breaking** changes with migration steps.

Voice rules:
- Present tense, second person ("You can now…")
- No "powerful", "seamless", "revolutionary", "leverage"
- Numbers where you have them
- Short — most items are one line

Output: ready-to-publish markdown.
