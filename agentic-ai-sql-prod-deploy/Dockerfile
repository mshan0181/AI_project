# syntax=docker/dockerfile:1
FROM python:3.11-slim as base

ENV PYTHONUNBUFFERED=1
ENV APP_HOME=/app
WORKDIR ${APP_HOME}

RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc default-libmysqlclient-dev build-essential curl ca-certificates \
  && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --upgrade pip setuptools wheel \
    && pip install --no-cache-dir -r requirements.txt

COPY . .

RUN useradd -m -d ${APP_HOME} appuser || true && chown -R appuser:appuser ${APP_HOME}
USER appuser

FROM base as mcp
CMD ["uvicorn", "app.mysql_mcp_server:app", "--host", "0.0.0.0", "--port", "8080", "--proxy-headers"]

FROM base as gradio
CMD ["python", "app/gradio_agentic_ui.py", "--server-name", "0.0.0.0", "--server-port", "7860"]
