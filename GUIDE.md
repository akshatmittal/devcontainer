# Dev Container Guide

This repository publishes a reusable Dev Container image:

```text
ghcr.io/akshatmittal/devcontainer:latest
```

It includes:

- Docker Hub `ubuntu:noble` (24.04.04)
- Node 24 via `nvm`
- `pnpm` via Corepack
- Codex CLI
- Claude Code

## Using This Image

In another repository, add `.devcontainer/devcontainer.json`:

```json
{
  "name": "My Project",
  "image": "ghcr.io/akshatmittal/devcontainer:latest",
  "remoteUser": "vscode"
}
```

You can extend it with project-specific features and commands:

```json
{
  "name": "My Project",
  "image": "ghcr.io/akshatmittal/devcontainer:latest",
  "features": {
    "ghcr.io/devcontainers/features/github-cli:1": {}
  },
  "postCreateCommand": "pnpm install",
  "remoteUser": "vscode"
}
```

## Agent Credentials

Do not bake Codex or Claude credentials into the image. Credentials should be mounted into the running devcontainer, not copied during Docker build. This keeps secrets out of image layers and GHCR.

Prefer using dedicated host folders for devcontainer agent credentials instead of mounting your full host `~/.codex` or `~/.claude` directories. Dedicated folders reduce the chance of exposing unrelated sessions, settings, logs, or tokens to projects that do not need them but still allow sharing agent sessions.

Create dedicated host folders:

```sh
mkdir -p ~/.devcontainer-agents/codex ~/.devcontainer-agents/claude
```

Mount them into a consuming repo's `.devcontainer/devcontainer.json`:

```json
{
  "name": "My Project",
  "image": "ghcr.io/akshatmittal/devcontainer:latest",
  "mounts": [
    "source=${localEnv:HOME}/.devcontainer-agents/codex,target=/home/vscode/.codex,type=bind",
    "source=${localEnv:HOME}/.devcontainer-agents/claude,target=/home/vscode/.claude,type=bind"
  ],
  "remoteUser": "vscode"
}
```

If you intentionally want to share your normal host agent state, you can mount the default folders instead:

```json
{
  "mounts": [
    "source=${localEnv:HOME}/.codex,target=/home/vscode/.codex,type=bind",
    "source=${localEnv:HOME}/.claude,target=/home/vscode/.claude,type=bind"
  ]
}
```

Use the dedicated-folder approach unless you specifically need full host agent state in the container.
