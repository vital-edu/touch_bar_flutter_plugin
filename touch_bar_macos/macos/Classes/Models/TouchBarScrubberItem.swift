// Copyright (c) 2020 Eduardo Vital Alencar Cunha
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

enum TouchBarScrubberItemType: String {
  case label = "ScrubberLabel"
  case image = "ScrubberImage"
}

protocol TouchBarScrubberItem {
  var type: TouchBarScrubberItemType { get }
}

class TouchBarScrubberLabel: TouchBarLabelData, TouchBarScrubberItem {
  let type: TouchBarScrubberItemType = .label
}

struct TouchBarScrubberImage : TouchBarScrubberItem {
  let image: NSImage
  let type: TouchBarScrubberItemType = .image

  init(withData data: NSDictionary) {
    let touchBarImage = data["image"] as! TouchBarImage
    self.image = touchBarImage.image
  }
}
