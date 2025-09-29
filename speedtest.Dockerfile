FROM alpine:latest

# Instala netcat y dependencias
RUN apk add --no-cache netcat-openbsd ca-certificates

# Copia el binario de speedtest-exporter desde la imagen original
COPY --from=ghcr.io/miguelndecarvalho/speedtest-exporter:latest /bin/speedtest-exporter /bin/speedtest-exporter

# Usa usuario sin privilegios
USER nobody

EXPOSE 9798

ENTRYPOINT ["/bin/speedtest-exporter"]
