#!/usr/bin/env bash
# ─────────────────────────────────────────────────────────────
#  post-create.sh — Runs after the container is fully created
#  • Installs shell tooling (shfmt)
#  • Configures ZSH plugins for a better terminal experience
# ─────────────────────────────────────────────────────────────
set -euo pipefail

echo "🛠️  [post-create] Installing shfmt..."
curl -sS https://webi.sh/shfmt | sh &>/dev/null || true

# ── ZSH plugins (oh-my-zsh) ─────────────────────────────────
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

if [ -d "$HOME/.oh-my-zsh" ]; then
  echo "🐚 [post-create] Installing ZSH plugins..."

  # Syntax highlighting
  if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    git clone --depth 1 \
      https://github.com/zsh-users/zsh-syntax-highlighting.git \
      "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
  fi

  # Auto-suggestions
  if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    git clone --depth 1 \
      https://github.com/zsh-users/zsh-autosuggestions.git \
      "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
  fi

  # Enable the plugins in .zshrc (idempotent)
  if ! grep -q "zsh-syntax-highlighting" ~/.zshrc 2>/dev/null; then
    sed -i -E \
      's/^(plugins=\()(git)(\))/\1\2 zsh-syntax-highlighting zsh-autosuggestions\3/' \
      ~/.zshrc
  fi

  # Disable less for git log
  if ! grep -q "unset LESS" ~/.zshrc 2>/dev/null; then
    echo -e "\nunset LESS" >> ~/.zshrc
  fi
fi

# ── Helpful aliases ──────────────────────────────────────────
cat >> ~/.zshrc << 'ALIASES'

# Jekyll shortcuts
alias js="bundle exec jekyll serve -l -H 0.0.0.0"
alias jb="JEKYLL_ENV=production bundle exec jekyll build"
alias jt="bash tools/test.sh"
alias jc="bundle exec jekyll clean"
ALIASES

echo "✅ [post-create] Done!"
