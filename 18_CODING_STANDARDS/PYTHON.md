# PYTHON.md

## Version
- Python 3.12+ (3.13 preferred for free-threaded experiments)
- Manage with `uv` (preferred) or `pyenv`

## Tooling
- **Formatter:** `ruff format`
- **Linter:** `ruff check` (covers most of flake8, isort, pyupgrade)
- **Types:** `mypy --strict`
- **Tests:** `pytest` + `pytest-asyncio`
- **Deps:** `uv` with `pyproject.toml`; lockfile committed

## Rules
- **Type-annotate everything** including `-> None` returns.
- **`Any` is banned.** Use `object` for "anything", or define a protocol.
- **`@dataclass(frozen=True, slots=True)`** by default; `pydantic.BaseModel` at API boundaries only.
- **No `from foo import *`.**
- **No mutable default args.** Use `None` + `if x is None: x = []`.
- **Prefer `@dataclass` over class with `__init__`** unless behavior needed.
- **Use `pathlib.Path`**, never `os.path`.
- **Use `match` / structural pattern matching** over big `if/elif` ladders.

## Errors
- Define a domain exception base class; subclass per case.
- Never `except:` or `except Exception:` without re-raising or narrow handling.
- Use `raise X from y` to preserve cause.

## Async
- `async def` for I/O-bound; use threads/processes for CPU-bound.
- Use `asyncio.TaskGroup` (3.11+) over `gather` for structured cancellation.
- Use `anyio` if you want sync/async portability.

## Logging
- `structlog` or stdlib `logging` with JSON formatter.
- Bind context (`request_id`, `user_id`) once; don't pass through every call.
