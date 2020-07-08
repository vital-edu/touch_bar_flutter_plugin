// Copyright (c) 2020 Eduardo Vital Alencar Cunha
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import FlutterMacOS
import Foundation
import AppKit

@available(macOS 10.12.2, *)
public class TouchBarPlugin: NSObject, FlutterPlugin, NSTouchBarDelegate, NSApplicationDelegate {
  var items: NSArray?

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
      guard let touchBarJson = (call.arguments as? NSDictionary)?["touch_bar"] as? NSDictionary,
        let children = touchBarJson["children"] as? NSArray else {
        return result("FlutterUnexpectedArguments")
      }

      self.items = children
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

    let identifiers = (0...((self.items?.count ?? 0) - 1)).map {
      NSTouchBarItem.Identifier(String($0))
    }

    newTouchBar.defaultItemIdentifiers = identifiers
    return newTouchBar
  }

  public func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItem.Identifier) -> NSTouchBarItem? {
    let item = NSCustomTouchBarItem(identifier: identifier)

    guard
      let itemData = self.items?.object(at: Int(identifier.rawValue) ?? 0) as? NSDictionary,
      let label = itemData["label"] as? String else {
      return nil
    }

    let accessibilityLabel = itemData["accessibilityLabel"] as? String

    let textField = NSTextField(labelWithString: label)
    textField.setAccessibilityLabel(accessibilityLabel)

    if let color = itemData["color"] as? NSDictionary,
        let red = color["red"] as? CGFloat,
        let green = color["green"] as? CGFloat,
        let blue = color["blue"] as? CGFloat,
        let alpha = color["alpha"] as? CGFloat {
        textField.textColor = NSColor(deviceRed: red, green: green, blue: blue, alpha: alpha)
    }

    item.view = textField
    return item;
  }
}
