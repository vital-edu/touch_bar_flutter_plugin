// Copyright (c) 2020 Eduardo Vital Alencar Cunha
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

@available(OSX 10.12.2, *)
class TouchBarPopover: NSPopoverTouchBarItem, TouchBarItem, NSTouchBarDelegate {
  required init?(identifier: NSTouchBarItem.Identifier, withData itemData: NSDictionary) {
    super.init(identifier: identifier)

    let label = itemData["label"] as? String ?? ""
    let showCloseButton = itemData["showCloseButton"] as? Bool ?? true

    (self.collapsedRepresentation as! NSButton).title = label
    self.showsCloseButton = showCloseButton

    if let children = itemData["children"] as? NSArray {
      self.popoverTouchBar = TouchBar(items: children)
    }

    if let icon = itemData["icon"] as? TouchBarImage {
      (self.collapsedRepresentation as! NSButton).image = icon.image
    }

    if let iconPosition = itemData["iconPosition"] as? String {
      (self.collapsedRepresentation as! NSButton).imagePosition = ImagePosition(iconPosition).toImagePosition()
    }
  }

  func update(data: NSDictionary) {
    if let label = data["label"] as? String {
      (self.collapsedRepresentation as! NSButton).title = label
    } else if let showCloseButton = data["showCloseButton"] as? Bool {
      self.showsCloseButton = showCloseButton
    } else if let icon = data["icon"] as? TouchBarImage {
      (self.collapsedRepresentation as! NSButton).image = icon.image
    } else if let iconPosition = data["iconPosition"] as? String {
      (self.collapsedRepresentation as! NSButton).imagePosition = ImagePosition(iconPosition).toImagePosition()
    } else if let children = data["children"] as? NSArray {
      self.popoverTouchBar = TouchBar(items: children)
    }
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
