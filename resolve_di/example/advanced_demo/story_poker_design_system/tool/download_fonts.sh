#!/usr/bin/env bash
# Downloads the bundled fonts (Inter + JetBrains Mono) into assets/fonts/.
# Run once after checkout:  bash tool/download_fonts.sh
set -euo pipefail
cd "$(dirname "$0")/.."

INTER_URL="https://github.com/rsms/inter/releases/download/v4.1/Inter-4.1.zip"
JBM_URL="https://github.com/JetBrains/JetBrainsMono/releases/download/v2.304/JetBrainsMono-2.304.zip"

mkdir -p assets/fonts
tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

echo "Downloading Inter..."
curl -fsSL -o "$tmp/inter.zip" "$INTER_URL"
echo "Downloading JetBrains Mono..."
curl -fsSL -o "$tmp/jbm.zip" "$JBM_URL"

for w in Regular Medium SemiBold Bold ExtraBold; do
  unzip -jo "$tmp/inter.zip" "*Inter-$w.ttf" -d assets/fonts >/dev/null
done
for w in Regular Medium SemiBold Bold; do
  unzip -jo "$tmp/jbm.zip" "*JetBrainsMono-$w.ttf" -d assets/fonts >/dev/null
done

echo "Done:"
ls -1 assets/fonts/*.ttf
