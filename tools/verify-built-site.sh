#!/usr/bin/env bash

set -euo pipefail

site_dir="${1:-_site}"
homepage="$site_dir/index.html"

if [[ ! -f "$homepage" ]]; then
  echo "Generated homepage not found: $homepage" >&2
  exit 1
fi

if grep -Eq '^---[[:space:]]*$' "$homepage" || grep -Eq '^layout:[[:space:]]*home' "$homepage"; then
  echo "Generated homepage contains raw Jekyll front matter: $homepage" >&2
  exit 1
fi

if ! grep -qi '<!doctype html' "$homepage"; then
  echo "Generated homepage is missing an HTML doctype: $homepage" >&2
  exit 1
fi

if ! grep -q 'id="post-list"' "$homepage"; then
  echo "Generated homepage is missing the Chirpy post list: $homepage" >&2
  exit 1
fi

if ! grep -q 'End of Line' "$homepage"; then
  echo "Generated homepage is missing the expected site tagline: $homepage" >&2
  exit 1
fi

echo "Verified generated homepage: $homepage"
