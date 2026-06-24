#!/usr/bin/env bash
#
# Build the macOS app and produce:
#   1. lumi.dmg            — drag-to-install disk image for direct distribution.
#   2. Runner.xcarchive    — archive for a Mac App Store upload via Xcode.
#
# The Mac App Store accepts a .pkg, NOT a .ipa (.ipa is iOS/tvOS only, and
# `flutter build macos` has no ipa equivalent). The .pkg is produced from the
# archive by Xcode's "Distribute App" flow, which auto-creates the required
# "Mac Installer Distribution" certificate and a matching App Store provisioning
# profile — the command-line `xcodebuild -exportArchive` path fails when those
# don't already exist locally (the cause of the earlier signing error).
#
# After this script finishes:
#   Xcode > Window > Organizer > Archives > select the new archive >
#   "Distribute App" > "App Store Connect" > Upload.
#
# Usage:
#   ./build_macos.sh             # build + DMG + archive (for App Store upload)
#   ./build_macos.sh --dmg-only  # build + DMG only (skip the archive)
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$REPO_ROOT"

DMG_ONLY=false
[[ "${1:-}" == "--dmg-only" ]] && DMG_ONLY=true

WORKSPACE="macos/Runner.xcworkspace"
SCHEME="Runner"
RELEASE_DIR="build/macos/Build/Products/Release"
ARCHIVE_PATH="build/macos/Runner.xcarchive"

# Compile the Release build (also generates Lumi.app under $RELEASE_DIR).
flutter build macos --release

# --- DMG (direct distribution) -------------------------------------------
(
  cd "$RELEASE_DIR"
  rm -f lumi.dmg
  create-dmg \
    --volname "Lumi Installer" \
    --window-pos 200 120 \
    --window-size 600 300 \
    --icon-size 100 \
    --icon "Lumi.app" 175 120 \
    --app-drop-link 425 120 \
    "lumi.dmg" \
    "Lumi.app"
)
echo "DMG written to $RELEASE_DIR/lumi.dmg"

if [[ "$DMG_ONLY" == true ]]; then
  exit 0
fi

# --- Archive (Mac App Store) ---------------------------------------------
# Produce a signed archive. Distribution/upload is done from Xcode's Organizer
# so Xcode can create the installer certificate + App Store profile on demand.
rm -rf "$ARCHIVE_PATH"

xcodebuild archive \
  -workspace "$WORKSPACE" \
  -scheme "$SCHEME" \
  -configuration Release \
  -destination "generic/platform=macOS" \
  -archivePath "$ARCHIVE_PATH"

echo ""
echo "Archive written to $ARCHIVE_PATH"
echo "To upload to the Mac App Store:"
echo "  1. Open Xcode > Window > Organizer > Archives."
echo "     (If the archive isn't listed, double-click $ARCHIVE_PATH to open it.)"
echo "  2. Select the archive > Distribute App > App Store Connect > Upload."
echo "  Xcode will create the Mac Installer Distribution cert + App Store"
echo "  provisioning profile automatically and sign the .pkg for you."
