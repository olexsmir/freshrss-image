#!/usr/bin/env bash
set -eou pipefail

IMAGE_NAME="ghcr.io/olexsmir/freshrss-image"
TAG="${1:-latest}"

echo "[!] Building image $IMAGE_NAME:$TAG"
docker build -f Containerfile -t "$IMAGE_NAME:$TAG" .
