# ─────────────────────────────────────────────────────────────
#  Dev Container for Jekyll + Chirpy Theme blog
#  Ruby 3.3 on Debian Bookworm — matches GitHub Pages CI
# ─────────────────────────────────────────────────────────────
FROM mcr.microsoft.com/devcontainers/ruby:3.3-bookworm

# ── System packages ──────────────────────────────────────────
RUN apt-get update && apt-get install -y --no-install-recommends \
      build-essential \
      git \
      curl \
      zlib1g-dev \
      libffi-dev \
      libyaml-dev \
      nodejs \
      npm \
      lsof \
    && rm -rf /var/lib/apt/lists/*

# ── Bundler config ───────────────────────────────────────────
ENV BUNDLE_PATH=/usr/local/bundle
RUN gem install bundler

# ── Working directory ────────────────────────────────────────
WORKDIR /workspace

# ── Default user ─────────────────────────────────────────────
USER vscode

# ── Expose Jekyll serve + LiveReload ─────────────────────────
EXPOSE 4000 35729
