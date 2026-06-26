import Cocoa
import FlutterMacOS

/// Flutter plugin that bridges MPV player to Dart via method and event channels
class MpvPlayerPlugin: NSObject, FlutterPlugin, FlutterStreamHandler, MpvPluginShared {

  // MARK: - Properties

  private var playerCore: MpvPlayerCore?
  var eventSink: FlutterEventSink?
  private weak var registrar: FlutterPluginRegistrar?
  var nameToId: [String: Int] = [:]

  // MpvPluginShared conformance
  var coreBase: MpvPlayerCoreBase? { playerCore }
  func setPlayerVisible(_ visible: Bool) { playerCore?.setVisible(visible) }
  func updatePlayerFrame() { playerCore?.updateFrame() }

  // PiP on macOS was removed: it relied on Apple's private PIP.framework
  // (PIPViewController), which is not permitted on the App Store (Guideline
  // 2.5.1). The `com.lumi/pip` channel stays registered but reports PiP as
  // unsupported so the Flutter side degrades gracefully.
  private var pipChannel: FlutterMethodChannel?

  // MARK: - FlutterPlugin Registration

  static func register(with registrar: FlutterPluginRegistrar) {
    // Method channel for commands
    let methodChannel = FlutterMethodChannel(
      name: "com.lumi/mpv_player",
      binaryMessenger: registrar.messenger
    )

    // Event channel for state updates
    let eventChannel = FlutterEventChannel(
      name: "com.lumi/mpv_player/events",
      binaryMessenger: registrar.messenger
    )

    let pipChannel = FlutterMethodChannel(
      name: "com.lumi/pip",
      binaryMessenger: registrar.messenger
    )

    let instance = MpvPlayerPlugin()
    instance.registrar = registrar
    instance.pipChannel = pipChannel

    registrar.addMethodCallDelegate(instance, channel: methodChannel)
    eventChannel.setStreamHandler(instance)
    pipChannel.setMethodCallHandler(instance.handlePipCall)

    print("[MpvPlayerPlugin] Registered with Flutter")
  }

  // MARK: - FlutterStreamHandler

  func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink)
    -> FlutterError?
  {
    self.eventSink = events
    print("[MpvPlayerPlugin] Event stream connected")
    return nil
  }

  func onCancel(withArguments arguments: Any?) -> FlutterError? {
    self.eventSink = nil
    print("[MpvPlayerPlugin] Event stream disconnected")
    return nil
  }

  // MARK: - FlutterPlugin Method Handler

  func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "initialize":
      handleInitialize(result: result)

    case "dispose":
      handleDispose(result: result)

    case "setProperty":
      handleSetProperty(call: call, result: result)

    case "getProperty":
      handleGetProperty(call: call, result: result)

    case "observeProperty":
      handleObserveProperty(call: call, result: result)

    case "command":
      handleCommand(call: call, result: result)

    case "setVisible":
      handleSetVisible(call: call, result: result)

    case "isInitialized":
      result(playerCore?.isInitialized ?? false)

    case "updateFrame":
      handleUpdateFrame(result: result)

    case "setLogLevel":
      handleSetLogLevel(call: call, result: result)

    default:
      result(FlutterMethodNotImplemented)
    }
  }

  // MARK: - PiP (removed on macOS — see note above)

  /// PiP is unsupported on macOS (the previous implementation used the private
  /// PIP.framework). Report `isSupported = false` and no-op the rest so the
  /// Flutter side never attempts to enter PiP.
  private func handlePipCall(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "isSupported":
      result(false)
    case "enter", "exit", "setAutoPipReady":
      result(nil)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  // MARK: - Platform-Specific Method Handlers

  private func handleInitialize(result: @escaping FlutterResult) {
    DispatchQueue.main.async { [weak self] in
      guard let self = self else {
        result(FlutterError(code: "ERROR", message: "Plugin deallocated", details: nil))
        return
      }

      // Check if already initialized
      if self.playerCore?.isInitialized == true {
        print("[MpvPlayerPlugin] Already initialized")
        result(true)
        return
      }

      // Find the Flutter window
      guard let (window, _, _) = self.findFlutterWindow() else {
        print("[MpvPlayerPlugin] Failed to find Flutter window")
        result(
          FlutterError(
            code: "NO_WINDOW", message: "Could not find Flutter window", details: nil))
        return
      }

      // Create and initialize player core
      let core = MpvPlayerCore()
      core.delegate = self

      guard core.initialize(in: window) else {
        print("[MpvPlayerPlugin] Failed to initialize MPV")
        result(
          FlutterError(
            code: "MPV_INIT_FAILED", message: "Failed to initialize MPV", details: nil))
        return
      }

      self.playerCore = core

      // Start hidden
      core.setVisible(false)

      print("[MpvPlayerPlugin] Initialized successfully")
      result(true)
    }
  }

  private func handleDispose(result: @escaping FlutterResult) {
    DispatchQueue.main.async { [weak self] in
      guard let self = self else { result(nil); return }
      self.playerCore?.dispose()
      self.playerCore = nil
      print("[MpvPlayerPlugin] Disposed")
      result(nil)
    }
  }

  private func handleSetProperty(call: FlutterMethodCall, result: @escaping FlutterResult) {
    guard let args = call.arguments as? [String: Any],
      let name = args["name"] as? String,
      let value = args["value"] as? String
    else {
      result(
        FlutterError(
          code: "INVALID_ARGS", message: "Missing 'name' or 'value' argument",
          details: nil))
      return
    }

    guard let core = playerCore else {
      result(nil)
      return
    }

    core.setPropertyAsync(name, value: value) { _ in
      if name == "pause" {
        let isPlaying = value == "no"
        core.setPaused(!isPlaying)
      }
      result(nil)
    }
  }

  // MARK: - Helpers

  private func findFlutterWindow() -> (NSWindow, NSView, NSView)? {
    for window in NSApplication.shared.windows {
      if window is MainFlutterWindow,
        let contentView = window.contentView,
        let contentVC = window.contentViewController
      {
        let flutterView = contentVC.view
        return (window, contentView, flutterView)
      }
    }

    // Fallback
    for window in NSApplication.shared.windows {
      if let contentView = window.contentView,
        let contentVC = window.contentViewController
      {
        let flutterView = contentVC.view
        return (window, contentView, flutterView)
      }
    }

    return nil
  }
}
