#!/usr/bin/env bash
#
# Build the macOS app and produce two artifacts:
#   1. lumi.dmg  — drag-to-install disk image for direct distribution.
#   2. lumi.pkg  — signed installer for a Mac App Store upload.
#
# The Mac App Store accepts a .pkg, NOT a .ipa (.ipa is an iOS/tvOS format and
# `flutter build macos` has no ipa equivalent). The .pkg is produced by
# archiving the Runner scheme and exporting with macos/ExportOptions.plist
# (method: app-store-connect, automatic signing, team JF8YN4AJTF).
#
# Usage:
#   ./build_macos.sh             # build + DMG + App Store .pkg
#   ./build_macos.sh --dmg-only  # build + DMG only (skip archive/export)
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$REPO_ROOT"

DMG_ONLY=false
[[ "${1:-}" == "--dmg-only" ]] && DMG_ONLY=true

WORKSPACE="macos/Runner.xcworkspace"
SCHEME="Runner"
RELEASE_DIR="build/macos/Build/Products/Release"
ARCHIVE_PATH="build/macos/Runner.xcarchive"
PKG_EXPORT_DIR="build/macos/pkg"

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

# --- .pkg (Mac App Store) ------------------------------------------------
# Archive, then export a signed installer package via xcodebuild.
rm -rf "$ARCHIVE_PATH" "$PKG_EXPORT_DIR"

xcodebuild archive \
  -workspace "$WORKSPACE" \
  -scheme "$SCHEME" \
  -configuration Release \
  -destination "generic/platform=macOS" \
  -archivePath "$ARCHIVE_PATH"

xcodebuild -exportArchive \
  -archivePath "$ARCHIVE_PATH" \
  -exportOptionsPlist macos/ExportOptions.plist \
  -exportPath "$PKG_EXPORT_DIR"

echo ""
echo "App Store package written to $PKG_EXPORT_DIR/*.pkg"
echo "Upload to App Store Connect with:"
echo "  xcrun altool --upload-app -f $PKG_EXPORT_DIR/*.pkg -t macos --apiKey <KEY_ID> --apiIssuer <ISSUER_ID>"
echo "  (or open it in Transporter.app)"
