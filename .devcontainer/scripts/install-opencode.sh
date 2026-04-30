#!/usr/bin/env bash
set -euo pipefail

\. "${HOME}/.nvm/nvm.sh"

# Install OpenCode.
pnpm install -g opencode-ai --allow-build=opencode-ai

# Verify OpenCode is available.
opencode --version
