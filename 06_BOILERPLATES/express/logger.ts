/**
 * Structured JSON logger with correlation ID propagation (pino + AsyncLocalStorage).
 *
 * Usage:
 *   import { log, runWithContext } from "./logger";
 *   runWithContext({ correlationId, userId }, () => {
 *     log.info({ orderId }, "order.created");
 *   });
 */
import { AsyncLocalStorage } from "node:async_hooks";
import pino, { type Logger } from "pino";

type Context = {
  correlationId?: string;
  userId?: string;
  tenantId?: string;
  traceId?: string;
  spanId?: string;
};

const als = new AsyncLocalStorage<Context>();

const REDACT_PATHS = [
  "password",
  "ssn",
  "creditCard",
  "cvv",
  "secret",
  "apiKey",
  "token",
  "authorization",
  '*.password',
  '*.token',
  '*.secret',
];

const base = pino({
  level: process.env.LOG_LEVEL ?? "info",
  timestamp: pino.stdTimeFunctions.isoTime,
  formatters: {
    level: (label) => ({ level: label }),
    bindings: (bindings) => ({
      service: process.env.SERVICE_NAME,
      env: process.env.APP_ENV,
      version: process.env.GIT_SHA ?? "dev",
      pid: bindings.pid,
      hostname: bindings.hostname,
    }),
  },
  redact: { paths: REDACT_PATHS, censor: "[REDACTED]" },
  mixin: () => {
    const ctx = als.getStore();
    return ctx ? { ...ctx } : {};
  },
});

export const log: Logger = base;

export function runWithContext<T>(ctx: Context, fn: () => T): T {
  return als.run({ ...(als.getStore() ?? {}), ...ctx }, fn);
}

export function getCorrelationId(): string | undefined {
  return als.getStore()?.correlationId;
}
