// Copyright (c) 2020 Eduardo Vital Alencar Cunha
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import FlutterMacOS
import Foundation
import AppKit

@available(macOS 10.12.2, *)
public class TouchBarPlugin: NSObject, FlutterPlugin {
  static var channel: FlutterMethodChannel!

  var items: NSArray?

  public static func register(with registrar: FlutterPluginRegistrar) {
    self.channel = FlutterMethodChannel(
      name: "plugins.flutter.io/touch_bar",
      binaryMessenger: registrar.messenger,
      codec: FlutterStandardMethodCodec(
        readerWriter: TouchBarPluginReaderWritter()
      )
    )

    let instance = TouchBarPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "setTouchBar":
      guard let touchBarJson = (call.arguments as? NSDictionary)?["touch_bar"] as? NSDictionary,
        let children = touchBarJson["children"] as? NSArray else {
        return result("FlutterUnexpectedArguments")
      }

      NSApp.keyWindow!.touchBar = TouchBar(items: children)
    default:
      result("FlutterMethodNotImplemented")
    }
  }
}

// MARK: - NSApplicationDelegate
extension TouchBarPlugin: NSApplicationDelegate {
  public func applicationDidFinishLaunching(_ aNotification: Notification) {
    NSApplication.shared.isAutomaticCustomizeTouchBarMenuItemEnabled = true
  }
}
