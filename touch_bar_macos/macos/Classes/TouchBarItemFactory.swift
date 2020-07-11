// Copyright (c) 2020 Eduardo Vital Alencar Cunha
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import Foundation

class TouchBarItemFactory {
  public func get(touchBarItem: NSDictionary, withIdentifier identifier: NSTouchBarItem.Identifier) -> NSTouchBarItem? {
    guard let label = touchBarItem["label"] as? String else {
      return nil
    }

    let accessibilityLabel = touchBarItem["accessibilityLabel"] as? String
    let textField = NSTextField(labelWithString: label)
    textField.setAccessibilityLabel(accessibilityLabel)

    if let color = touchBarItem["color"] as? NSDictionary,
        let red = color["red"] as? CGFloat,
        let green = color["green"] as? CGFloat,
        let blue = color["blue"] as? CGFloat,
        let alpha = color["alpha"] as? CGFloat {
        textField.textColor = NSColor(deviceRed: red, green: green, blue: blue, alpha: alpha)
    }

    let item = NSCustomTouchBarItem(identifier: identifier)
    item.view = textField

    return item
  }
}
