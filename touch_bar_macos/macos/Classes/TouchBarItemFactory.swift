// Copyright (c) 2020 Eduardo Vital Alencar Cunha
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import Foundation

class TouchBarItemFactory {
  public func get(touchBarItem: NSDictionary, withIdentifier identifier: NSTouchBarItem.Identifier) -> NSTouchBarItem? {
    guard let type: String = touchBarItem["type"] as? String else {
        return nil
    }

    switch type {
      case "Label":
        return TouchBarLabel(identifier: identifier, withData: touchBarItem)
      default:
        return nil
    }
  }
}