// Copyright (c) 2020 Eduardo Vital Alencar Cunha
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import FlutterMacOS
import Foundation
import AppKit

@available(macOS 10.12.2, *)
public class TouchBarPlugin: NSObject, FlutterPlugin, NSTouchBarDelegate, NSApplicationDelegate {
  var flutterResult: FlutterMethodCall?;

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(
      name: "plugins.flutter.io/touch_bar",
      binaryMessenger: registrar.messenger
    )
    let instance = TouchBarPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "setTouchBar":
      self.flutterResult = call

      NSApp.keyWindow!.touchBar = makeTouchBar();
    default:
      result("FlutterMethodNotImplemented")
    }
  }

  public func applicationDidFinishLaunching(_ aNotification: Notification) {
    NSApplication.shared.isAutomaticCustomizeTouchBarMenuItemEnabled = true
  }

  func makeTouchBar() -> NSTouchBar? {
    let newTouchBar = NSTouchBar();
    newTouchBar.delegate = self
    newTouchBar.defaultItemIdentifiers = [NSTouchBarItem.Identifier("myTest")]
    return newTouchBar
  }

  public func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItem.Identifier) -> NSTouchBarItem? {
    let item = NSCustomTouchBarItem(identifier: identifier)

    guard let flutterResult = flutterResult else { return nil }
    let label: String = (flutterResult.arguments as? String) ?? "failed to parse"

    item.view = NSTextField(labelWithString: label)
    return item;
  }
}
