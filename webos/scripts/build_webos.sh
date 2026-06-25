#!/usr/bin/env bash
#
# Build the Lumi webOS app and package it into an installable .ipk.
#
# Pipeline: sync version from pubspec.yaml -> enact pack -p -> ares-package
#           -> webos/ipk/com.mogkhang.lumi_<X.Y.Z>_all.ipk
#
# The version is ALWAYS taken from the repo's pubspec.yaml (single source of
# truth), so webOS stays consistent with Android/iOS/macOS — never hardcode it.
#
# Notes:
#   - The webOS CLIs (enact, ares-package) live under nvm, which is not on the
#     non-interactive PATH, so this sources nvm first.
#   - `enact pack -p` already minifies. ares-package must therefore be told NOT
#     to minify again (--no-minify), otherwise it errors on the optimized JS.
#   - This ares-cli version throws a harmless "rimraf is not a function" during
#     its post-package temp cleanup AFTER the .ipk is written. We verify the
#     artifact exists instead of trusting the exit code.
#
# Run the .ipk in the webOS TV 22 Simulator (it is not an ares SSH target):
#   open the app via webOS Studio "Run", or load this dist/ in the Simulator.
# To sideload to a real TV / emulator later:
#   ares-install --device <name> webos/ipk/com.mogkhang.lumi_*.ipk
# Source nvm BEFORE strict mode: nvm.sh references unset vars and can return
# non-zero, which `set -euo pipefail` would treat as a fatal error.
export NVM_DIR="$HOME/.nvm"
# shellcheck disable=SC1091
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" >/dev/null 2>&1 || true

set -euo pipefail

WEBOS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
REPO_ROOT="$(cd "$WEBOS_DIR/.." && pwd)"
cd "$WEBOS_DIR"

DIST_DIR="dist"
IPK_DIR="ipk"
APPINFO="webos-meta/appinfo.json"

# --- Version sync: pubspec.yaml is the single source of truth ---------------
# pubspec "version: X.Y.Z+N" -> appinfo version=X.Y.Z, buildNumber=N. webOS only
# uses the X.Y.Z "version" (it also names the .ipk), so the build number rides
# along in a custom field to stay consistent with Android/macOS/iOS.
PUBSPEC="$REPO_ROOT/pubspec.yaml"
RAW_VERSION="$(grep -E '^version:' "$PUBSPEC" | head -1 | sed -E 's/^version:[[:space:]]*//')"
VERSION_NAME="${RAW_VERSION%%+*}"
BUILD_NUMBER="${RAW_VERSION##*+}"
if [[ -z "$VERSION_NAME" || ! "$VERSION_NAME" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "ERROR: could not parse a X.Y.Z version from $PUBSPEC (got '$RAW_VERSION')" >&2
  exit 1
fi
[[ "$BUILD_NUMBER" == "$RAW_VERSION" ]] && BUILD_NUMBER=""  # no '+N' present
echo "==> version $VERSION_NAME (build ${BUILD_NUMBER:-none}) from pubspec.yaml"
node -e '
  const fs = require("fs");
  const f = process.argv[1], v = process.argv[2], b = process.argv[3];
  const a = JSON.parse(fs.readFileSync(f, "utf8"));
  a.version = v;
  if (b) a.buildNumber = b; else delete a.buildNumber;
  fs.writeFileSync(f, JSON.stringify(a, null, "\t") + "\n");
' "$APPINFO" "$VERSION_NAME" "$BUILD_NUMBER"

echo "==> enact pack -p"
npm run pack-p

echo "==> ares-package"
mkdir -p "$IPK_DIR"
rm -f "$IPK_DIR"/*.ipk
# Tolerate the post-write rimraf crash; we check the artifact below.
ares-package "$DIST_DIR" --no-minify --outdir "$IPK_DIR" || true

IPK="$(ls -t "$IPK_DIR"/*.ipk 2>/dev/null | head -1)"
if [[ -z "${IPK:-}" || ! -s "$IPK" ]]; then
  echo "ERROR: no .ipk produced in $IPK_DIR" >&2
  exit 1
fi

echo ""
echo "Built: $WEBOS_DIR/$IPK"
echo "Run it in the webOS TV 22 Simulator (via webOS Studio), or sideload with:"
echo "  ares-install --device <device> \"$WEBOS_DIR/$IPK\""
