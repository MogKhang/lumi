#!/usr/bin/env bash
#
# Build, archive and export the tvOS app for App Store Connect / TestFlight.
#
# tvOS is a hand-wired Flutter target (no official `flutter build ipa` support),
# so this drives xcodebuild directly on tvos/Runner.xcworkspace. The Runner
# "Run Script" build phase invokes scripts/xcode_appletv.sh which compiles the
# Dart code into App.framework, so a normal `xcodebuild archive` produces a
# complete app.
#
# Signing is automatic (team JF8YN4AJTF, see tvos/ExportOptions.plist): Xcode
# resolves/creates the Apple Distribution cert and the tvOS App Store
# provisioning profile, provided the account is signed into Xcode and the App
# ID has tvOS enabled in the developer portal.
#
# Usage:
#   ./build_tvos.sh                # archive + export an .ipa for TestFlight
#   ./build_tvos.sh --pods         # also re-run the full pod/engine wiring first
#                                  # (needed after engine.version or plugin changes)
#   ./build_tvos.sh --archive-only # stop after producing the .xcarchive
#
# Env overrides:
#   FLUTTER_ROOT   host Flutter SDK (default: ~/Documents/Apps/flutter)
#   BUILD_CONFIG   xcodebuild configuration (default: Release)

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TVOS_DIR="${REPO_ROOT}/tvos"
export FLUTTER_ROOT="${FLUTTER_ROOT:-$HOME/Documents/Apps/flutter}"
FLUTTER="${FLUTTER_ROOT}/bin/flutter"
BUILD_CONFIG="${BUILD_CONFIG:-Release}"

WORKSPACE="${TVOS_DIR}/Runner.xcworkspace"
SCHEME="Runner"
EXPORT_OPTIONS="${TVOS_DIR}/ExportOptions.plist"
BUILD_OUT="${REPO_ROOT}/build/tvos"
ARCHIVE_PATH="${BUILD_OUT}/Runner.xcarchive"
EXPORT_PATH="${BUILD_OUT}/ipa"

RUN_PODS=0
ARCHIVE_ONLY=0
for arg in "$@"; do
  case "$arg" in
    --pods) RUN_PODS=1 ;;
    --archive-only) ARCHIVE_ONLY=1 ;;
    *) echo "error: unknown argument '$arg'" >&2; exit 2 ;;
  esac
done

if [[ ! -x "$FLUTTER" ]]; then
  echo "error: flutter not found at $FLUTTER (set FLUTTER_ROOT)" >&2
  exit 1
fi

echo "==> [1/5] Fetching tvOS engine and writing Generated.xcconfig"
FLUTTER_ROOT="$FLUTTER_ROOT" bash "${TVOS_DIR}/scripts/fetch_engine.sh"

echo "==> [2/5] flutter pub get"
( cd "$REPO_ROOT" && "$FLUTTER" pub get )

if [[ "$RUN_PODS" == "1" ]]; then
  # Full re-wire. Required after engine.version or plugin changes: the Podfile
  # post_install bakes the engine's Flutter.framework search paths into the
  # Pods project at `pod install` time, so the ordering below is mandatory.
  echo "==> [3/5] Re-running pod install + target/pods wiring (--pods)"
  bash "${TVOS_DIR}/scripts/pod_install.sh"
  bash "${TVOS_DIR}/scripts/set_tvos_target_pods.sh"
  ruby "${TVOS_DIR}/scripts/wire_pods_dependency.rb"
else
  echo "==> [3/5] Skipping pod re-wire (pass --pods after engine/plugin changes)"
  if [[ ! -f "${TVOS_DIR}/Pods/Pods.xcodeproj/project.pbxproj" ]]; then
    echo "error: tvos/Pods is not set up. Re-run with --pods first." >&2
    exit 1
  fi
fi

echo "==> [4/5] Archiving (config=$BUILD_CONFIG, generic tvOS device)"
rm -rf "$ARCHIVE_PATH"
mkdir -p "$BUILD_OUT"
# Archive UNSIGNED, then sign at export. This is the only flow that works for
# this hand-wired tvOS project:
#   * A signed archive with AUTOMATIC signing forces a tvOS *Development*
#     profile, which fails "your team has no devices..." (this team has no
#     registered tvOS devices — and the distribution path needs none).
#   * MANUAL distribution signing on the command line leaks the app's profile
#     onto the plugin Pod targets (universal_gamepad/os_media_controls/
#     wakelock_plus/Pods-Runner), which reject it ("does not support
#     provisioning profiles").
# So we archive unsigned and let `-exportArchive` (below) do all the signing.
# Verified: -exportArchive with the app-store-connect ExportOptions deep-signs
# the app AND all 33 embedded frameworks (Libass/mpv/etc.) with the Apple
# Distribution cert — no ad-hoc framework is left, so App Store validation
# accepts it.
xcodebuild archive \
  -workspace "$WORKSPACE" \
  -scheme "$SCHEME" \
  -configuration "$BUILD_CONFIG" \
  -destination 'generic/platform=tvOS' \
  -archivePath "$ARCHIVE_PATH" \
  CODE_SIGNING_ALLOWED=NO \
  CODE_SIGNING_REQUIRED=NO \
  CODE_SIGN_IDENTITY="" \
  COMPILER_INDEX_STORE_ENABLE=NO

if [[ "$ARCHIVE_ONLY" == "1" ]]; then
  echo ""
  echo "Archive written to $ARCHIVE_PATH"
  echo "Distribute from Xcode Organizer, or re-run without --archive-only to export an .ipa."
  exit 0
fi

echo "==> [5/5] Exporting .ipa for App Store Connect / TestFlight"
rm -rf "$EXPORT_PATH"
xcodebuild -exportArchive \
  -archivePath "$ARCHIVE_PATH" \
  -exportOptionsPlist "$EXPORT_OPTIONS" \
  -exportPath "$EXPORT_PATH" \
  -allowProvisioningUpdates

IPA="$(ls "$EXPORT_PATH"/*.ipa 2>/dev/null | head -1)"
if [[ -z "$IPA" ]]; then
  echo "error: export produced no .ipa" >&2
  exit 1
fi

# Pre-flight signing check. App Store validation rejects any embedded framework
# that isn't signed with the Apple Distribution cert (the "Libass.framework is
# not properly signed" 409). Verify here so a bad build is caught BEFORE upload.
echo "==> Verifying code signatures in $IPA"
VERIFY_DIR="$(mktemp -d)"
trap 'rm -rf "$VERIFY_DIR"' EXIT
( cd "$VERIFY_DIR" && unzip -q "$IPA" )
APP_DIR="$VERIFY_DIR/Payload/Runner.app"
bad=0
for item in "$APP_DIR" "$APP_DIR"/Frameworks/*; do
  [[ -e "$item" ]] || continue
  # Capture into a variable first: piping `codesign` straight into `grep -q`
  # makes grep close the pipe on the first match, killing codesign with SIGPIPE
  # — which under `set -o pipefail` looks like a failure and false-flags the
  # item as unsigned.
  sig="$(codesign -dvv "$item" 2>&1)"
  if [[ "$sig" != *"Authority=Apple Distribution"* ]]; then
    echo "  NOT distribution-signed: ${item#"$APP_DIR"/}" >&2
    bad=$((bad + 1))
  fi
done
if [[ "$bad" -gt 0 ]]; then
  echo "error: $bad item(s) are not Apple Distribution signed — do NOT upload." >&2
  exit 1
fi
echo "    OK: app + all frameworks are Apple Distribution signed."

echo ""
echo "Done. .ipa written to $IPA"
echo "Upload to TestFlight with Transporter.app, or:"
echo "  xcrun altool --upload-app -f \"$IPA\" -t tvos --apiKey <KEY_ID> --apiIssuer <ISSUER_ID>"
