FROM ubuntu:noble

ENV DEBIAN_FRONTEND=noninteractive 

# Basic
RUN <<EOF
set -e
apt-get update
apt-get install -y --no-install-recommends ca-certificates curl git lsb-release sudo
if getent passwd ubuntu >/dev/null; then
  usermod --login vscode --move-home --home /home/vscode ubuntu
  if getent group ubuntu >/dev/null; then
    groupmod --new-name vscode ubuntu
  fi
else
  groupadd --gid 1000 vscode
  useradd --uid 1000 --gid 1000 -m -s /bin/bash vscode
fi
echo "vscode ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/vscode
chmod 0440 /etc/sudoers.d/vscode
apt-get clean
rm -rf /var/lib/apt/lists/*
EOF

# Node
COPY --chown=vscode:vscode scripts/install-node.sh /tmp/install-node.sh
USER vscode
RUN <<EOF
set -e
chmod +x /tmp/install-node.sh
/tmp/install-node.sh
rm /tmp/install-node.sh
EOF

USER root
