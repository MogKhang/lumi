# Contributing

## Getting Started

1. Fork and clone the repository
2. Run `flutter pub get` to install dependencies
3. Run `dart run build_runner build` to generate code
4. Start developing!

## Running on iOS Simulator

Simulators must be **booted** before Flutter can connect to them. They default to `Shutdown` state.

1. List available simulators and find the UDID:
   ```bash
   xcrun simctl list devices available
   ```

2. Boot and run:
   ```bash
   xcrun simctl boot <UDID> && open -a Simulator && flutter run -d <UDID>
   ```

## Running on tvOS (Apple TV Simulator)

tvOS uses a **custom Flutter engine** and cannot be run with `flutter run` directly. Follow these steps:

### One-time setup

1. **Download the tvOS simulator runtime** (requires Xcode):
   ```bash
   xcodebuild -downloadPlatform tvOS
   ```

2. **Create an Apple TV simulator**:
   ```bash
   xcrun simctl create "Apple TV 4K" \
     com.apple.CoreSimulator.SimDeviceType.Apple-TV-4K-3rd-generation-4K \
     com.apple.CoreSimulator.SimRuntime.tvOS-26-5
   ```
   Note the UDID printed — you'll use it below.

3. **Fetch the custom Flutter tvOS engine** (cached after first run):
   ```bash
   bash tvos/scripts/fetch_engine.sh
   ```

4. **Install CocoaPods dependencies**:
   ```bash
   bash tvos/scripts/pod_install.sh
   ```

### Building and running

Run these steps each time you want to run on tvOS:

```bash
# 1. Boot the simulator and open it
xcrun simctl boot <UDID>
open -a Simulator

# 2. Build (run from repo root)
cd tvos && xcodebuild \
  -workspace Runner.xcworkspace \
  -scheme Runner \
  -configuration Debug \
  -destination "id=<UDID>" \
  build && cd ..

# 3. Install and launch
xcrun simctl install <UDID> \
  "$(find ~/Library/Developer/Xcode/DerivedData -path '*/Debug-appletvsimulator/Runner.app' | head -1)"
xcrun simctl launch <UDID> com.mogkhang.lumi
```

> **Note:** After `fetch_engine.sh` runs, it writes `tvos/Flutter/Generated.xcconfig` pointing to the cached engine. Re-run `fetch_engine.sh` whenever `tvos/engine.version` changes.

## Development

- Follow Dart/Flutter conventions
- Run `dart format .` to format Dart code (note: generated files like `*.g.dart` are excluded from CI checks)
- Run `scripts/format_native.sh --fix` to format Kotlin, Swift, C++, C, Objective-C, and native headers
- Run `flutter analyze` before submitting to check for issues
- Run `flutter test` if tests are available
- Test your changes thoroughly

### Code Quality Checks

The project includes automated CI checks that run on all pull requests:

1. **Code Formatting**: Ensures code follows Dart and native formatting standards
   - Run locally: `dart format .` to format Dart files
   - Run locally: `scripts/format_native.sh --fix` to format native files
   - Note: CI only checks non-generated files (excludes `.g.dart`, `.freezed.dart`)
   - Generated files are reformatted automatically by build tools

2. **Static Analysis**: Checks for code issues and potential bugs
   - Run locally: `flutter analyze`
   - Note: CI excludes generated files from analysis (configured in `analysis_options.yaml`)

3. **Tests**: Runs unit and widget tests (when available)
   - Run locally: `flutter test`

All these checks must pass before your changes can be merged.

## Internationalization (i18n)

This project uses `slang` for internationalization with JSON files.

### Adding New Strings

1. Add your string to `lib/i18n/strings.i18n.json`:
   ```json
   {
     "section": {
       "myNewString": "My new text"
     }
   }
   ```

2. Run `dart run slang` to regenerate translation files

3. Use in your code:
   ```dart
   Text(t.section.myNewString)
   ```

### Adding New Languages

1. Create new JSON file: `lib/i18n/[locale].i18n.json`
2. Copy structure from `en.i18n.json` and translate values
3. Run `dart run slang` to regenerate files

### Guidelines

- Organize strings logically in nested objects
- Use camelCase for keys
- Keep strings concise and clear
- Always run `dart run slang` after changes
