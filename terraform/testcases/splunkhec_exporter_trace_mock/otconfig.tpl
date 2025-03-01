extensions:
  pprof:
    endpoint: 0.0.0.0:1777
receivers:
  otlp:
    protocols:
      grpc:
        endpoint: 0.0.0.0:${grpc_port}

processors:
  batch:

exporters:
  logging:
    loglevel: debug
  splunk_hec:
    endpoint: "https://${mock_endpoint}"
    token: dummytoken

service:
  pipelines:
    traces:
      receivers: [otlp]
      processors: [batch]
      exporters: [splunk_hec]
  extensions: [pprof]
  telemetry:
    logs:
      level: debug
