# OpenTelemetry Setup

## Node.js

```ts
// src/observability/otel.ts
import { NodeSDK } from "@opentelemetry/sdk-node";
import { getNodeAutoInstrumentations } from "@opentelemetry/auto-instrumentations-node";
import { OTLPTraceExporter } from "@opentelemetry/exporter-trace-otlp-http";
import { OTLPMetricExporter } from "@opentelemetry/exporter-metrics-otlp-http";
import { PeriodicExportingMetricReader } from "@opentelemetry/sdk-metrics";
import { resourceFromAttributes } from "@opentelemetry/resources";
import { SemanticResourceAttributes } from "@opentelemetry/semantic-conventions";

const resource = resourceFromAttributes({
  [SemanticResourceAttributes.SERVICE_NAME]: process.env.SERVICE_NAME!,
  [SemanticResourceAttributes.SERVICE_VERSION]: process.env.GIT_SHA ?? "dev",
  [SemanticResourceAttributes.DEPLOYMENT_ENVIRONMENT]: process.env.APP_ENV!,
});

export const sdk = new NodeSDK({
  resource,
  traceExporter: new OTLPTraceExporter({ url: process.env.OTEL_EXPORTER_OTLP_ENDPOINT }),
  metricReader: new PeriodicExportingMetricReader({
    exporter: new OTLPMetricExporter({ url: process.env.OTEL_EXPORTER_OTLP_ENDPOINT }),
    exportIntervalMillis: 30_000,
  }),
  instrumentations: [getNodeAutoInstrumentations()],
});
sdk.start();
```

Load before any other import: `node --import ./dist/observability/otel.js dist/server.js`.

## Python

```python
# src/observability/otel.py
from opentelemetry import trace, metrics
from opentelemetry.sdk.resources import Resource
from opentelemetry.sdk.trace import TracerProvider
from opentelemetry.sdk.trace.export import BatchSpanProcessor
from opentelemetry.exporter.otlp.proto.http.trace_exporter import OTLPSpanExporter
from opentelemetry.sdk.metrics import MeterProvider
from opentelemetry.sdk.metrics.export import PeriodicExportingMetricReader
from opentelemetry.exporter.otlp.proto.http.metric_exporter import OTLPMetricExporter
from opentelemetry.instrumentation.fastapi import FastAPIInstrumentor
from opentelemetry.instrumentation.sqlalchemy import SQLAlchemyInstrumentor
import os

resource = Resource.create({
    "service.name": os.environ["SERVICE_NAME"],
    "service.version": os.environ.get("GIT_SHA", "dev"),
    "deployment.environment": os.environ["APP_ENV"],
})

trace.set_tracer_provider(TracerProvider(resource=resource))
trace.get_tracer_provider().add_span_processor(BatchSpanProcessor(OTLPSpanExporter()))

reader = PeriodicExportingMetricReader(OTLPMetricExporter(), export_interval_millis=30_000)
metrics.set_meter_provider(MeterProvider(resource=resource, metric_readers=[reader]))

def instrument(app):
    FastAPIInstrumentor.instrument_app(app)
    SQLAlchemyInstrumentor().instrument()
```

## Collector
- Deploy as sidecar (per pod) or agent (per node) — sidecar for high cardinality, agent for cost.
- Exporters: Honeycomb, Grafana Tempo, Datadog — pick one.
- Sampler: `parentbased_traceidratio(0.1)` baseline; `always_on` for errors.

## Required attributes on every span
- `service.name`, `service.version`, `deployment.environment`
- `http.method`, `http.route`, `http.status_code` (for HTTP)
- `db.system`, `db.statement` (redacted) — for DB calls
- `messaging.system`, `messaging.destination` — for queues

## Propagation
- W3C `traceparent` header
- Include in outbound HTTP, queue messages, cron triggers
