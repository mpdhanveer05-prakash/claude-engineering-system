# AI_AGENT_TEMPLATE

> Overlay of `UNIVERSAL_PROJECT_TEMPLATE` for AI/agent applications using Claude.

## Stack defaults
| Layer | Choice |
|-------|--------|
| Model SDK | Anthropic SDK (Python or TS) |
| Default model | claude-opus-4-7 (planning), claude-sonnet-4-6 (default), claude-haiku-4-5 (fast/cheap) |
| Prompt caching | **Always on** |
| Vector DB | pgvector (default) → Pinecone/Weaviate as scale demands |
| Eval framework | Promptfoo or custom + Inspect |
| Tracing | Langfuse or Helicone |
| Tool use | First-class — every tool in `src/tools/` with Zod/Pydantic schema |

## Required additions to project `CLAUDE.md`

```markdown
## AI app-specific rules
- Every call to the model uses prompt caching with explicit cache breakpoints.
- System prompts versioned in `src/prompts/` with semver-style filename: `system-v1.2.md`.
- Tool definitions co-located with their implementation; schema is the source of truth.
- Every LLM call logged: prompt hash, model, tokens, latency, cost, cache hit/miss.
- Cost dashboard with per-feature attribution.
- Evals run in CI on a frozen golden set; PR blocks if regression > 2%.
- No prompt injection — user content always isolated in clearly-delimited blocks; never trusted as instructions.
- Output validation: schema check + content safety classifier before returning to user.
- Rate limit by tenant AND by Anthropic API key bucket.
- Cache invalidation explicit when prompt template changes.
- Fallback model defined for every call (Opus → Sonnet → Haiku → fail).
- Streaming responses gracefully degrade on partial output.
```

## Folders added
```
src/
├── prompts/             # System prompts (versioned files)
├── tools/               # Tool definitions + handlers
├── agents/              # Agent orchestration
├── evals/               # Eval datasets + harness
├── safety/              # Content filters, injection detection
└── retrieval/           # Vector store, retrievers, rerankers
```

## Additional docs
- `docs/ai/PROMPT_LIBRARY.md` — index of system prompts with versions
- `docs/ai/EVAL_STRATEGY.md` — how we evaluate quality
- `docs/ai/COST_MODEL.md` — per-feature cost expectations
- `docs/ai/SAFETY.md` — content policy + injection mitigation
- `docs/ai/MODEL_ROUTING.md` — when to use Opus vs Sonnet vs Haiku
- `docs/ai/RAG_ARCHITECTURE.md` — retrieval design
