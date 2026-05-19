#!/usr/bin/env bash

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

if [[ -f .env ]]; then
  set -a
  # shellcheck disable=SC1091
  source .env
  set +a
fi

TELEPATHY_DB="${TELEPATHY_DB:-.telepathy/events.db}"
TELEPATHY_PROJECT="${TELEPATHY_PROJECT:-local}"
TELEPATHY_ACTOR="${TELEPATHY_ACTOR:-local-agent}"

sql_escape() {
  printf "%s" "$1" | sed "s/'/''/g"
}

require_db() {
  if ! command -v sqlite3 >/dev/null 2>&1; then
    echo "sqlite3 is required" >&2
    exit 1
  fi
  if [[ ! -f "$TELEPATHY_DB" ]]; then
    echo "Database not found at $TELEPATHY_DB. Run ./setup.sh first." >&2
    exit 1
  fi
}

new_event_id() {
  printf "evt_%s_%s" "$(date +%s)" "$$"
}
