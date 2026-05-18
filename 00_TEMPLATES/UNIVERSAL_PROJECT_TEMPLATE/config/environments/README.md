# config/environments/

Per-environment configuration. Layered: defaults → env-specific → local override.

```
config/environments/
├── default.yaml      # baseline
├── dev.yaml          # dev overrides
├── staging.yaml      # staging overrides
├── prod.yaml         # prod overrides
└── README.md
```

Rules:
- **No secrets** here. Secrets via the secret manager only. This file holds *config shape* and *non-sensitive overrides*.
- Schema-validated at startup (Zod / Pydantic). Fail fast on missing required keys.
- Match the env via `APP_ENV` env var.
