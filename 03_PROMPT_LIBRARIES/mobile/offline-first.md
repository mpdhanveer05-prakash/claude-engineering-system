# Offline-First Mobile Feature

**Goal:** Design or implement a mobile feature that works without connectivity.
**When to use:** Any feature on a flaky network (transit, field work, low-bandwidth markets).
**Inputs:** feature spec, data model, sync conflict semantics.
**Output shape:** Architecture sketch + queue + reconciliation rules + code.
**Stop conditions:** Don't claim "offline-first" without an explicit conflict resolution policy.

---

Design an offline-first implementation of: {FEATURE}

Data involved: {DATA}
Conflict model: {LWW | CRDT | manual-resolve | server-wins | client-wins}

Process:
1. **Local store** — schema, indexes, encryption at rest (Keychain/Keystore for sensitive).
2. **Mutation queue** — durable, ordered, idempotent operations with retry policy.
3. **Sync engine** — push queue on reconnect, pull deltas, reconcile.
4. **Conflict resolution** — explicit policy per field/entity.
5. **UI optimistic state** — show pending, retried, failed states.
6. **Edge cases**: app killed mid-mutation, token expired, server schema drift.

Output:
- Architecture diagram (Mermaid)
- Local schema
- Queue + sync API
- Code for one mutation end-to-end as an example
- Tests covering: offline mutation, reconnect sync, conflict, retry exhaustion
