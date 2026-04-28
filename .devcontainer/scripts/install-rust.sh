#!/usr/bin/env bash
set -euo pipefail

export CARGO_HOME="${CARGO_HOME:-${HOME}/.cargo}"
export RUSTUP_HOME="${RUSTUP_HOME:-${HOME}/.rustup}"

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --profile minimal --default-toolchain stable

# In lieu of restarting the shell.
\. "${CARGO_HOME}/env"

rustup --version
rustc --version
cargo --version
