// Copyright (c) 2020 Eduardo Vital Alencar Cunha
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import Foundation

class TouchBarLabel: NSCustomTouchBarItem, TouchBarItem {
  required init?(identifier: NSTouchBarItem.Identifier, withData itemData: NSDictionary) {
    super.init(identifier: identifier)

    // extract item data
    guard let label = itemData["label"] as? String else { return nil }
    let accessibilityLabel = itemData["accessibilityLabel"] as? String
    let rgbaColor = itemData["color"] as? NSDictionary

    // setup NSTextField with extracted data
    let textField = NSTextField(labelWithString: label)
    textField.setAccessibilityLabel(accessibilityLabel)
    textField.textColor = NSColor(fromRGBA: rgbaColor)

    self.view = textField
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
