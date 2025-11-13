#!/usr/bin/env bash
set -e

if [ -f .env ]; then
  set -a
  source .env
  set +a
fi

host="${MYSQL_HOST:-mysql}"
port=3306
for i in $(seq 1 60); do
  if timeout 1 bash -c "echo > /dev/tcp/$host/$port" 2>/dev/null; then
    break
  fi
  sleep 1
done

uvicorn app.mysql_mcp_server:app --host 0.0.0.0 --port 8080 --log-level info &
UVICORN_PID=$!

python app/gradio_agentic_ui.py --server-name 0.0.0.0 --server-port 7860

kill ${UVICORN_PID} || true
wait ${UVICORN_PID} 2>/dev/null || true
