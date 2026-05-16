#!/usr/bin/env bash
# ─────────────────────────────────────────────────────────────
#  on-create.sh — Runs once when the container is first created
#  • Marks workspace as a safe git directory
#  • Installs Ruby gem dependencies
#  • Builds JS/CSS assets if package.json exists
# ─────────────────────────────────────────────────────────────
set -euo pipefail

echo "🔧 [on-create] Configuring git safe directory..."
git config --global --add safe.directory /workspace

echo "📦 [on-create] Installing Ruby gem dependencies..."
bundle install --jobs "$(nproc)" --retry 3

# If the theme ships a package.json (Chirpy does for JS assets), install & build
if [ -f package.json ]; then
  echo "📦 [on-create] Installing Node.js dependencies..."
  npm install
  echo "🏗️  [on-create] Building JS/CSS assets..."
  npm run build
fi

echo "✅ [on-create] Done!"
