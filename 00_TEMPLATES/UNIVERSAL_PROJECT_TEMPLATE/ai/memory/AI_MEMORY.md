# AI_MEMORY.md

> Durable, non-obvious facts about this project that Claude needs to remember across sessions. Curated by humans, audited quarterly. **Not a journal.** See `MEMORY_MANAGEMENT_SYSTEM.md` at workspace root.

---

## How to add an entry

1. Check it satisfies the **3 memory questions** (durable? general? surprising?).
2. Append to the relevant section below.
3. Include the **why** so future-Claude can apply judgment.
4. Date-stamp it.

Template:

```markdown
## <One-line fact>
**Type:** invariant | gotcha | preference | constraint
**Added:** YYYY-MM-DD
**Why:** <one sentence>
**Apply when:** <trigger>
**Evidence:** <file:line or PR# or doc>
```

---

## Invariants (always true, never break)

_(Add as discovered.)_

## Gotchas (surprised us once, will surprise again)

_(Add as discovered.)_

## Preferences (style / approach decisions)

_(Add as discovered.)_

## Constraints (external limits we operate inside)

_(Add as discovered.)_

---

## Sentinel example (delete once first real entry added)

## Money is always integer cents
**Type:** invariant
**Added:** YYYY-MM-DD
**Why:** Float arithmetic silently corrupted three invoices in v0.4.
**Apply when:** any code touches `amount`, `price`, `total`, or DB columns of money type.
**Evidence:** `src/billing/money.ts`, ADR-0012.

---

*Cap: ~200 lines. If you outgrow, split into `AI_MEMORY_<DOMAIN>.md` files and index here.*
