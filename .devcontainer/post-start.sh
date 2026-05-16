#!/usr/bin/env bash
# ─────────────────────────────────────────────────────────────
#  post-start.sh — Runs every time the container starts
#  • Kills stale Jekyll/LiveReload processes from prior runs
#  • Prints quick-start instructions
# ─────────────────────────────────────────────────────────────
set -euo pipefail

# Kill any zombie Jekyll processes from a previous session
for PORT in 4000 35729; do
  PID=$(lsof -t -i:"$PORT" 2>/dev/null || true)
  if [ -n "$PID" ]; then
    kill -9 "$PID" 2>/dev/null || true
    echo "🧹 [post-start] Killed stale process on port $PORT (PID: $PID)"
  fi
done

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  🚀  Jekyll Dev Container Ready!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "  Quick commands:"
echo "    js    → Start Jekyll with live-reload (port 4000)"
echo "    jb    → Production build"
echo "    jt    → Run HTML-Proofer tests"
echo "    jc    → Clean Jekyll cache"
echo ""
echo "  Or run manually:"
echo "    bundle exec jekyll serve -l -H 0.0.0.0"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
