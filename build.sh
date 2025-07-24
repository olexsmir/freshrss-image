#!/usr/bin/env bash
set -eou pipefail

IMAGE_NAME="${1:?Missing image name}"
TAG="${2:-latest}"

echo "[!] Building image $IMAGE_NAME:$TAG"
docker build -f Containerfile -t "$IMAGE_NAME:$TAG" .
