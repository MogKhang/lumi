# Compile the Release Build
flutter build macos --release

# Move to the build folder
cd build/macos/Build/Products/Release/

# Generate the DMG file
create-dmg \
  --volname "Lumi Installer" \
  --window-pos 200 120 \
  --window-size 600 300 \
  --icon-size 100 \
  --icon "Lumi.app" 175 120 \
  --app-drop-link 425 120 \
  "Lumi.dmg" \
  "Lumi.app"
