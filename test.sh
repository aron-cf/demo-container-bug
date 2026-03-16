#!/usr/bin/env bash


cleanup() {
    if [ -n "$APP_PID" ] && ps -p $APP_PID > /dev/null; then
        echo -e "\n--- Cleaning up: Killing process $APP_PID ---"
        kill $APP_PID
        wait $APP_PID 2>/dev/null
    fi
}

run() {
  echo "Running with wrangler@${1}..."
  local LOGFILE="wrangler-${1}.log"
  npm install -s --no-audit --no-fund "wrangler@${1}"
  npm start -- --port 8787 > "$LOGFILE" 2>&1 &
  APP_PID=$!

  echo "Starting web server (logging to $LOGFILE)..."

  local ENDPOINT="http://localhost:8787"
  local MAX_RETRIES=30
  local COUNT=0

  echo "Polling $ENDPOINT..."
  until $(curl --output /dev/null --silent --head --fail "$ENDPOINT"); do
      if [ $COUNT -eq $MAX_RETRIES ]; then
        echo "Error: Server failed to start within $((MAX_RETRIES / 2)) seconds."
        exit 1
      fi

      printf '.'
      sleep 1
      ((COUNT++))
  done

  echo
  curl -sS "$ENDPOINT/container/1"

  cleanup
}

trap cleanup EXIT SIGINT SIGTERM


run 4.72.0

run 4.73.0
