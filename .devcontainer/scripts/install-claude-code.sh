#!/usr/bin/env bash
set -euo pipefail

\. "${HOME}/.nvm/nvm.sh"

# Install Claude Code.
pnpm install -g @anthropic-ai/claude-code --allow-build=@anthropic-ai/claude-code

# Verify Claude Code is available.
claude --version
