"""Structured JSON logger with correlation ID propagation.

Usage:
    from logger import get_logger, set_correlation_id
    log = get_logger(__name__)
    log.info("order.created", order_id=order.id, user_id=user.id)
"""
from __future__ import annotations
import logging
import sys
from contextvars import ContextVar
from typing import Any

import structlog

_correlation_id: ContextVar[str | None] = ContextVar("correlation_id", default=None)
_user_id: ContextVar[str | None] = ContextVar("user_id", default=None)
_tenant_id: ContextVar[str | None] = ContextVar("tenant_id", default=None)


def set_correlation_id(value: str) -> None:
    _correlation_id.set(value)


def set_actor(user_id: str | None = None, tenant_id: str | None = None) -> None:
    if user_id is not None:
        _user_id.set(user_id)
    if tenant_id is not None:
        _tenant_id.set(tenant_id)


def _add_context(_, __, event: dict[str, Any]) -> dict[str, Any]:
    if (cid := _correlation_id.get()) is not None:
        event["correlation_id"] = cid
    if (uid := _user_id.get()) is not None:
        event["user_id"] = uid
    if (tid := _tenant_id.get()) is not None:
        event["tenant_id"] = tid
    return event


def _redact_pii(_, __, event: dict[str, Any]) -> dict[str, Any]:
    """Drop fields that are known PII regardless of where they come from."""
    forbidden = {"password", "ssn", "credit_card", "cvv", "secret", "api_key", "token"}
    for k in list(event.keys()):
        if k.lower() in forbidden:
            event[k] = "[REDACTED]"
    return event


def configure(level: str = "INFO") -> None:
    logging.basicConfig(stream=sys.stdout, level=level, format="%(message)s")
    structlog.configure(
        processors=[
            structlog.contextvars.merge_contextvars,
            _add_context,
            _redact_pii,
            structlog.processors.add_log_level,
            structlog.processors.TimeStamper(fmt="iso", utc=True),
            structlog.processors.StackInfoRenderer(),
            structlog.processors.format_exc_info,
            structlog.processors.JSONRenderer(),
        ],
        wrapper_class=structlog.make_filtering_bound_logger(getattr(logging, level)),
        logger_factory=structlog.PrintLoggerFactory(),
        cache_logger_on_first_use=True,
    )


def get_logger(name: str) -> structlog.stdlib.BoundLogger:
    return structlog.get_logger(name)
