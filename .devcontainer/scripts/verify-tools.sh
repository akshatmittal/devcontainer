#!/usr/bin/env bash
set -euo pipefail

echo -n "Node: "
node --version

echo -n "npm: "
npm --version

echo -n "pnpm: "
pnpm --version

echo -n "Codex: "
codex --version

echo -n "Claude: "
claude --version

echo -n "OpenCode: "
opencode --version

echo -n "Rustup: "
rustup --version

echo -n "Rust: "
rustc --version

echo -n "Cargo: "
cargo --version

echo -n "Ubuntu: "
lsb_release -ds
