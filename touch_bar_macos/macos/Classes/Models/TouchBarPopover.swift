// Copyright (c) 2020 Eduardo Vital Alencar Cunha
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

class TouchBarPopover: NSPopoverTouchBarItem, TouchBarItem, NSTouchBarDelegate {
  required init?(identifier: NSTouchBarItem.Identifier, withData itemData: NSDictionary) {
    super.init(identifier: identifier)

    let label = itemData["label"] as? String ?? ""
    let showCloseButton = itemData["showCloseButton"] as? Bool ?? true

    self.collapsedRepresentationLabel = label
    self.showsCloseButton = showCloseButton

    if let children = itemData["children"] as? NSArray {
      self.popoverTouchBar = TouchBar(items: children)
    }

    if let icon = itemData["icon"] as? TouchBarImage {
      self.collapsedRepresentationImage = icon.image
    }

    // The icon position must be the last property to be set
    // because collapsedRepresentationImage and collapsedRepresentationLabel
    // overrides it.
    if let position = itemData["imagePosition"] as? String {
      (self.collapsedRepresentation as! NSButton).imagePosition = ImagePosition(position).toImagePosition()
    }
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
