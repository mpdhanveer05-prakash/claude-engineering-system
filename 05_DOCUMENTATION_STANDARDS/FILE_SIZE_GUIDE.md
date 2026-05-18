# FILE_SIZE_GUIDE.md

## Targets
| Doc kind | Sweet spot | Hard cap |
|----------|-----------|----------|
| README.md | 100–250 lines | 400 |
| CLAUDE.md | 200–400 lines | 600 |
| AI_CONTEXT.md | 100–300 lines | 500 |
| AI_MEMORY.md | flexible (grows) | 200 lines per file → split |
| ADR | 50–150 lines | 250 |
| Runbook | 50–200 lines | 400 |
| API reference | 100–400 lines | 600 — split per resource |
| DB schema | 200–600 lines | 1000 — split per domain |

## When to split
- Exceeds the hard cap
- Distinct concerns mixed (auth + billing in same doc)
- TOC items >12 at the same level
- One section attracts >50% of edits — promote to its own file

## How to split
1. Create the new file at the same depth (or a sibling subfolder).
2. Move the content; leave a one-line stub link in the original.
3. Update any cross-references.
4. Add the new file to the parent index/TOC.

## Why this matters for Claude
- Smaller docs → narrower context → fewer hallucinations.
- Splitting forces you to name the concept on its own — naming sharpens thinking.
- One file per concept means Claude can load just the file it needs.

## Chunking strategy for huge artifacts
For things that legitimately are big (full DB schema, full API surface):
1. **Index file** at the top (`<area>/README.md`) with a one-line entry per sub-file.
2. **One file per resource / table / module.**
3. **Each sub-file under 500 lines.**
4. **Cross-links** between related files so Claude can navigate.

Example:
```
docs/api/
├── README.md                   # index of resources
├── auth.md
├── users.md
├── projects.md
├── billing.md
└── webhooks.md
```
