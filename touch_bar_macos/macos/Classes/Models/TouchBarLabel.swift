// Copyright (c) 2020 Eduardo Vital Alencar Cunha
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import Foundation

class TouchBarLabel: NSCustomTouchBarItem {
  init?(identifier: NSTouchBarItem.Identifier, withData itemData: NSDictionary) {
    super.init(identifier: identifier)

    guard let labelText = itemData["text"] as? String else {
      return nil
    }

    let accessibilityLabel = itemData["accessibilityLabel"] as? String
    let textField = NSTextField(labelWithString: labelText)
    textField.setAccessibilityLabel(accessibilityLabel)

    if let color = itemData["color"] as? NSDictionary,
        let red = color["red"] as? CGFloat,
        let green = color["green"] as? CGFloat,
        let blue = color["blue"] as? CGFloat,
        let alpha = color["alpha"] as? CGFloat {
        textField.textColor = NSColor(deviceRed: red, green: green, blue: blue, alpha: alpha)
    }

    self.view = textField
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
