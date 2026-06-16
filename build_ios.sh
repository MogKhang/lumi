#!/bin/bash
# Build a Release IPA for App Store Connect / TestFlight.
# Signing is automatic via Xcode using team JF8YN4AJTF (see ios/ExportOptions.plist).
set -euo pipefail

flutter build ipa --release --export-options-plist=ios/ExportOptions.plist

echo ""
echo "IPA written to build/ios/ipa/. Upload to TestFlight with:"
echo "  xcrun altool --upload-app -f build/ios/ipa/*.ipa -t ios --apiKey <KEY_ID> --apiIssuer <ISSUER_ID>"
echo "  (or open it in Transporter.app)"
