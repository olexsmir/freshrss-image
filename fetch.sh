#!/usr/bin/env bash
set -eou pipefail

EXT_DIR="$(dirname "$0")/extensions"
rm -rf "$EXT_DIR"
mkdir -p "$EXT_DIR"

## helpers
fetch_flat_repo() {
  local repo="$1"

  local tmp
  tmp="$(mktemp -d)"

  echo "[!] Fetching multiple extensions from $repo"
  git clone --depth=1 "$repo" "$tmp" 2>/dev/null

  for d in "$tmp"/*; do
    [[ -d "$d" ]] || continue
    cp -r "$d" "$EXT_DIR/$(basename "$d")"
  done

  rm -rf "$tmp"
}
fetch_extension() {
  local repo="$1"
  local name="$2"

  local tmp
  tmp="$(mktemp -d)"

  echo "[!] Fetching $name from $repo"
  git clone --depth=1 "$repo" "$tmp" 2>/dev/null
  cp -r "$tmp" "$EXT_DIR/$name"
  rm -rf "$tmp"
}

## getting the extensions
fetch_flat_repo "https://github.com/FreshRSS/Extensions"
fetch_flat_repo "https://github.com/cn-tools/cntools_FreshRssExtensions"
fetch_extension "https://framagit.org/nicofrand/xextension-threepanesview.git" "ThreePanesView"
fetch_extension "https://github.com/aledeg/xExtension-RedditImage" "RedditImage"
