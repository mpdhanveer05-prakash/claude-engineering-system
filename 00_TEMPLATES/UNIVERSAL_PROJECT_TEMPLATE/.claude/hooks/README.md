# .claude/hooks/

Shell commands the Claude Code harness runs in response to events. Hooks are configured in `settings.json` under the `hooks` key — files in this folder are the scripts those hooks invoke.

## Suggested hooks

- `pre-edit-secrets-scan.sh` — block edits if `gitleaks` finds a secret
- `post-edit-format.sh` — auto-format on edit (per file extension)
- `pre-bash-confirm-destructive.sh` — confirm any rm/drop/force command
- `on-session-end-log.sh` — append a stub session log

Example `settings.json` snippet:

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Edit|Write",
        "command": ".claude/hooks/pre-edit-secrets-scan.sh"
      }
    ],
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "command": ".claude/hooks/post-edit-format.sh"
      }
    ]
  }
}
```
