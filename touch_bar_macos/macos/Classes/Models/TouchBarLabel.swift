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
    let textColor = itemData["color"] as? NSColor

    // setup NSTextField with extracted data
    let textField = NSTextField(labelWithString: label)
    textField.setAccessibilityLabel(accessibilityLabel)
    textField.textColor = textColor

    self.view = textField
  }

  func update(data: NSDictionary) {
    if let label = data["label"] as? String {
      (self.view as! NSTextField).stringValue = label
    } else if let accessibilityLabel = data["accessibilityLabel"] as? String {
      (self.view as! NSTextField).setAccessibilityLabel(accessibilityLabel)
    } else if let textColor = data["color"] as? NSColor {
      (self.view as! NSTextField).textColor = textColor
    }
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
