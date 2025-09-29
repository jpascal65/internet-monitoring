FROM alpine:latest

# Instala Python, pip, netcat y paquetes de desarrollo
RUN apk add --no-cache \
	python3 \
	py3-pip \
	netcat-openbsd \
	ca-certificates \
	build-base \
	python3-dev \
	libffi-dev \
	openssl-dev \
	musl-dev

# Copia el código fuente del exporter desde la imagen original
COPY --from=ghcr.io/miguelndecarvalho/speedtest-exporter:latest /app /app

WORKDIR /app

# Instala dependencias Python
# RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 9798

CMD ["python3", "exporter.py"]
