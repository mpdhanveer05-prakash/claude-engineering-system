# 07_MCP_CONFIGURATIONS

Reusable MCP (Model Context Protocol) server configs Claude Code can attach.

## Layout
```
07_MCP_CONFIGURATIONS/
├── README.md
├── recommended-mcp-set.md      # baseline list per project type
└── examples/
    ├── postgres.json
    ├── github.json
    ├── filesystem.json
    └── slack.json
```

## How to add to a project
Edit project `.claude/settings.json`:

```json
{
  "mcpServers": {
    "postgres": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-postgres", "$DATABASE_URL"]
    },
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": { "GITHUB_PERSONAL_ACCESS_TOKEN": "$GITHUB_TOKEN" }
    }
  }
}
```

## Curation rules
- Only attach MCPs you actively use — every one adds context and tool overhead.
- Scope-limited servers preferred (read-only DB, single-repo GitHub) over broad ones.
- Never commit MCP credentials — reference env vars only.
- Audit MCP installs the same way you'd audit a dependency (source, last update, advisories).

## Per-project type defaults

| Project type | Recommended baseline |
|--------------|----------------------|
| Web app | filesystem, github |
| API backend | filesystem, github, postgres (read-only) |
| SaaS | + stripe (read), sentry (read) |
| AI agent | + vector store MCP |
| Mobile | filesystem, github |
| Open source | filesystem, github |
