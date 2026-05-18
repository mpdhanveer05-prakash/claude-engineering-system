# 17_ARCHITECTURE_BLUEPRINTS

Reference architectures to copy + adapt. Each blueprint = one diagram + the reasoning + the trade-offs + when to pick it.

| File | Style |
|------|-------|
| `MODULAR_MONOLITH.md` | Default for <10-engineer teams |
| `MICROSERVICES.md` | When module boundaries justify network ones |
| `SERVERLESS.md` | Bursty, event-driven, low-baseline workloads |
| `EVENT_DRIVEN.md` | Multi-domain systems needing decoupling |
| `CQRS.md` | Read-heavy with separate write models |
| `MULTI_TENANT_SAAS.md` | Shared DB + RLS pattern |
| `RAG_LLM_APP.md` | RAG pipeline with caching + evals |
| `STREAMING_PIPELINE.md` | Real-time data systems |
| `OFFLINE_FIRST_MOBILE.md` | Mobile sync architecture |

## Each blueprint should answer
1. **When this fits** (and when it doesn't)
2. **Container diagram** (Mermaid)
3. **Critical paths** with latency budget
4. **Failure modes** and recovery
5. **Cost shape**
6. **Two real-world references** to study
7. **When to evolve away from this**

## Anti-architecture
Resist:
- Microservices for <5-engineer teams
- Event-sourcing before you've felt the pain of CRUD
- Multi-cloud before you've mastered one
- Custom orchestration before you've tried managed
