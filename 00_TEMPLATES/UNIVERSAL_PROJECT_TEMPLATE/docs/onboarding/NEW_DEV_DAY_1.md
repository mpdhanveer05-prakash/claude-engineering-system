# NEW_DEV_DAY_1.md

> First day. Goal: a new engineer (or Claude joining the codebase) has a working dev env and ships a trivial PR.

---

## Morning

1. **Accounts** — get added to: GitHub org, Vercel, Auth0, Sentry, PostHog, Slack/Discord, 1Password.
2. **Hardware** — install: {language toolchains}, {pkg manager}, {Docker / Postgres locally}, VS Code + Claude Code.
3. **Clone & boot** — `git clone …`, `cp .env.example .env`, fill secrets, `{install} && {dev}`.
4. **First request** — hit `http://localhost:{PORT}` and see the home page.

## Afternoon

5. **Read in this order**:
   - `README.md`
   - `CLAUDE.md`
   - `ai/context/AI_CONTEXT.md`
   - `ai/context/PRODUCT_CONTEXT.md`
   - `docs/architecture/SYSTEM_ARCHITECTURE.md`
   - `docs/api/API_REFERENCE.md`
   - `docs/database/DATABASE_SCHEMA.md`
6. **Trivial PR** — fix a typo, add a missing alt-text, fill in a missing JSDoc. Use the PR checklist.
7. **Demo** — show the PR to your buddy.

## Week 1

- Skim `ai/memory/AI_MEMORY.md` and `ai/memory/gotchas.md`.
- Walk through `docs/runbooks/INCIDENT_RESPONSE.md` and `docs/runbooks/ROLLBACK.md`.
- Sit in an on-call shadow.
- Pick up a "good-first-issue" ticket.

## Pairing With Claude

- Open the project in Claude Code.
- First prompt: *"Read CLAUDE.md and ai/context/*. Summarize this project's mission, stack, and top 3 conventions I should follow."*
- Verify Claude understood by quizzing back: *"Where would I add a new API endpoint? What test must accompany it?"*
