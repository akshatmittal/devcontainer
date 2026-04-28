#!/usr/bin/env bash
set -euo pipefail

echo -n "node: "
node --version

echo -n "npm: "
npm --version

echo -n "pnpm: "
pnpm --version

echo -n "codex: "
codex --version

echo -n "claude: "
claude --version

echo -n "rustup: "
rustup --version

echo -n "rustc: "
rustc --version

echo -n "cargo: "
cargo --version

echo -n "ubuntu: "
lsb_release -ds
