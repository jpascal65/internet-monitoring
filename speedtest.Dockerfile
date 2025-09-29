FROM ghcr.io/miguelndecarvalho/speedtest-exporter:latest
USER root
RUN apk add --no-cache netcat-openbsd
USER nobody
ENTRYPOINT ["/bin/speedtest-exporter"]
