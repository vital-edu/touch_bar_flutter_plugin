// Copyright (c) 2020 Eduardo Vital Alencar Cunha
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import Foundation

class TouchBarButton: NSCustomTouchBarItem, TouchBarItem {
  var onClick : String?

  required init?(identifier: NSTouchBarItem.Identifier, withData itemData: NSDictionary) {
    super.init(identifier: identifier)

    // extract item data
    let label = itemData["label"] as? String ?? ""
    let accessibilityLabel = itemData["accessibilityLabel"] as? String
    let backgroundColor = itemData["backgroundColor"] as? NSColor
    self.onClick = itemData["onClick"] as? String

    let button: NSButton!
    if let icon = itemData["icon"] as? TouchBarImage {
      button = NSButton(
        title: label,
        image: icon.image,
        target: self,
        action: #selector(handleButtonClick)
      )
    } else {
      button = NSButton(
        title: label,
        target: self,
        action: #selector(handleButtonClick)
      )
    }

    if let position = itemData["iconPosition"] as? String {
      button.imagePosition = ImagePosition(position).toImagePosition()
    }

    button.setAccessibilityLabel(accessibilityLabel)
    button.bezelColor = backgroundColor

    self.view = button
  }

  func update(data: NSDictionary) {
    if let label = data["label"] as? String {
      (self.view as! NSButton).title = label
    } else if let accessibilityLabel = data["accessibilityLabel"] as? String {
      (self.view as! NSButton).setAccessibilityLabel(accessibilityLabel)
    } else if let backgroundColor = data["backgroundColor"] as? NSColor {
      (self.view as! NSButton).bezelColor = backgroundColor
    } else if let icon = data["icon"] as? TouchBarImage {
      (self.view as! NSButton).image = icon.image
    } else if let iconPosition = data["iconPosition"] as? String {
      (self.view as! NSButton).imagePosition = ImagePosition(iconPosition).toImagePosition()
    }
  }

  @objc func handleButtonClick(_ sender: NSButton) {
    if let onClick = self.onClick {
      TouchBarPlugin.channel.invokeMethod(onClick, arguments: nil)
    };
  }

  required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
}
