import Cocoa
import FlutterMacOS
import Foundation

@_silgen_name("swift_coroFrameAlloc")
public func swift_coroFrameAlloc(size: Int, typeId: UInt64) -> UnsafeMutableRawPointer {
    return malloc(size)
}

@main
class AppDelegate: FlutterAppDelegate {
  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    return true
  }

  override func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
    return true
  }
}
