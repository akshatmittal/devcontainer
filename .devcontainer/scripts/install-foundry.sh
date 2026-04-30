#!/usr/bin/env bash
set -euo pipefail

# Install Foundry.
curl -fsSL https://foundry.paradigm.xyz | bash
foundryup

# Verify Foundry tools are available.
forge --version
cast --version
anvil --version
chisel --version
