#!/usr/bin/env bash

set -euo pipefail

if [[ $# -eq 0 ]]; then
  echo "Usage: $0 <url> [url...]" >&2
  exit 1
fi

attempts="${VERIFY_LIVE_ATTEMPTS:-18}"
delay_seconds="${VERIFY_LIVE_DELAY_SECONDS:-20}"

normalize_url() {
  local url="$1"
  url="${url%/}/"
  printf '%s' "$url"
}

verify_url_once() {
  local url="$1"
  local body

  body="$(curl -fsSL --max-time 30 -H 'Cache-Control: no-cache' "$url")"

  if grep -Eq '^---[[:space:]]*$|^layout:[[:space:]]*home' <<<"$body"; then
    echo "Live homepage is serving raw Jekyll front matter: $url" >&2
    return 1
  fi

  if ! grep -qi '<!doctype html' <<<"$body"; then
    echo "Live homepage is missing an HTML doctype: $url" >&2
    return 1
  fi

  if ! grep -q 'id="post-list"' <<<"$body"; then
    echo "Live homepage is missing the Chirpy post list: $url" >&2
    return 1
  fi

  if ! grep -q 'End of Line' <<<"$body"; then
    echo "Live homepage is missing the expected site tagline: $url" >&2
    return 1
  fi
}

for raw_url in "$@"; do
  url="$(normalize_url "$raw_url")"
  cache_busted_url="${url}?deploy_check=${GITHUB_SHA:-manual}-$(date +%s)"
  verified=false

  for ((attempt = 1; attempt <= attempts; attempt++)); do
    if verify_url_once "$url" && verify_url_once "$cache_busted_url"; then
      echo "Verified live homepage: $url"
      verified=true
      break
    fi

    if ((attempt < attempts)); then
      echo "Live homepage check failed for $url; retrying in ${delay_seconds}s ($attempt/$attempts)" >&2
      sleep "$delay_seconds"
    fi
  done

  if [[ "$verified" != true ]]; then
    echo "Live homepage did not become healthy: $url" >&2
    exit 1
  fi
done
