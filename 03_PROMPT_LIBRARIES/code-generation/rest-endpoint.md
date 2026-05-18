# New REST Endpoint

**Goal:** Add a REST endpoint end-to-end per project conventions.
**When to use:** Any API surface addition.
**Inputs:**
- Endpoint spec: method, path, auth, request shape, response shape, side effects
- Where in the codebase to add (route file or "you decide")
**Output shape:**
- Code edits
- New tests (unit + integration)
- OpenAPI spec update
- API reference doc update
**Stop conditions:**
- Don't introduce new dependencies
- Don't change unrelated files
- If side effects involve external APIs, surface idempotency questions

---

Add a new endpoint to this codebase.

**Spec:**
- Method: {METHOD}
- Path: {PATH}
- Auth: {AUTH}
- Request shape: {REQUEST}
- Response shape: {RESPONSE}
- Side effects: {SIDE_EFFECTS}

Follow:
1. Read `docs/api/API_REFERENCE.md`, `25_API_STANDARDS/REST.md`, and the project `CLAUDE.md`.
2. Find the conventional location for new routes; grep similar endpoints for the pattern.
3. Implement:
   - Route handler (thin)
   - Use case (business logic)
   - Repository changes if needed
   - Request/response schemas (Zod/Pydantic)
4. Tests:
   - Unit on the use case
   - Integration on the route (200, 400, 401, 403, 404 paths)
5. Docs:
   - `docs/api/openapi.yaml` updated
   - `docs/api/API_REFERENCE.md` updated
6. Output a summary: files touched, tests added, any open questions.

Then run lint, type, and tests. Report results. Don't say "done" if anything is red.
