// Copyright (c) 2020 The TouchBar Flutter Plugin Authors
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

class TouchBarLabelData {
  let label: String
  let textColor: NSColor?
  let accessibilityLabel: String?

  init(withData itemData: NSDictionary) {
    self.label = itemData["label"] as? String ?? ""
    self.accessibilityLabel = itemData["accessibilityLabel"] as? String
    self.textColor = itemData["color"] as? NSColor
  }
}
