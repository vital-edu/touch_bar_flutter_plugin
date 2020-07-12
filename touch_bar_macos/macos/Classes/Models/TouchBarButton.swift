// Copyright (c) 2020 Eduardo Vital Alencar Cunha
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import Foundation

class TouchBarButton: NSCustomTouchBarItem, TouchBarItem {
  required init?(identifier: NSTouchBarItem.Identifier, withData itemData: NSDictionary) {
    super.init(identifier: identifier)

    // extract item data
    guard let label = itemData["label"] as? String else { return nil }
    let accessibilityLabel = itemData["accessibilityLabel"] as? String
    let rgbaBackgroundColor = itemData["backgroundColor"] as? NSDictionary

    // setup NSTextField with extracted data
    let button = NSButton(title: label, target: self, action: #selector(handleButtonClick))
    button.setAccessibilityLabel(accessibilityLabel)
    button.bezelColor = NSColor(fromRGBA: rgbaBackgroundColor)

    self.view = button
  }

  @objc func handleButtonClick(_ sender: NSButton) {
    print("button was clicked")
  }

  required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
}
