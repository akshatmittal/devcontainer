# Dev Container

A reusable Dev Container base image built on Ubuntu 24.04 LTS with Node.js 24.

The image is published to GitHub Container Registry:

```text
ghcr.io/akshatmittal/devcontainer:v1.0.0
ghcr.io/akshatmittal/devcontainer:latest
```

Use the semver tag when you want repeatable builds. Use `latest` only when you
want to follow the newest stable release.

## Use This Image

In another repository, add `.devcontainer/devcontainer.json`:

```json
{
  "name": "My Project",
  "image": "ghcr.io/akshatmittal/devcontainer:v1.0.0"
}
```

To follow the newest stable published image:

```json
{
  "name": "My Project",
  "image": "ghcr.io/akshatmittal/devcontainer:latest"
}
```

## Extend With Features

Downstream projects can add their own tools and editor settings on top:

```json
{
  "name": "My Project",
  "image": "ghcr.io/akshatmittal/devcontainer:v1.0.0",
  "features": {
    "ghcr.io/devcontainers/features/github-cli:1": {}
  },
  "customizations": {
    "vscode": {
      "extensions": [
        "esbenp.prettier-vscode"
      ]
    }
  },
  "postCreateCommand": "npm install"
}
```

## Extend With A Dockerfile

Use this image as the base when a project needs custom system packages:

```dockerfile
FROM ghcr.io/akshatmittal/devcontainer:v1.0.0

RUN apt-get update \
    && apt-get install -y --no-install-recommends ripgrep \
    && rm -rf /var/lib/apt/lists/*
```

Then reference it from `.devcontainer/devcontainer.json`:

```json
{
  "name": "My Project",
  "build": {
    "dockerfile": "Dockerfile"
  },
  "remoteUser": "vscode"
}
```

## Publishing

The GitHub Actions workflow builds the image on pull requests and pushes to
`main`. Release images are published only from semver tags.

To publish the first release:

```sh
git tag v1.0.0
git push origin main
git push origin v1.0.0
```

The `v1.0.0`, `latest`, and `sha-<short-sha>` tags will point at the same
published image for this release.

After the first package is created, set the GHCR package visibility to public in
GitHub if it is not public by default.
