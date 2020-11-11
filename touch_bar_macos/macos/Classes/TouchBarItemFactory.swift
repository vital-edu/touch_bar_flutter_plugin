// Copyright (c) 2020 Eduardo Vital Alencar Cunha
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import Foundation

@available(OSX 10.12.2, *)
class TouchBarItemFactory {
  public func get(touchBarItem: NSDictionary, withIdentifier identifier: NSTouchBarItem.Identifier) -> NSTouchBarItem? {
    guard let type: String = touchBarItem["type"] as? String else {
        return nil
    }

    switch type {
      case "Label":
        return TouchBarLabel(identifier: identifier, withData: touchBarItem)
      case "Button":
        return TouchBarButton(identifier: identifier, withData: touchBarItem)
      case "Popover":
        return TouchBarPopover(identifier: identifier, withData: touchBarItem)
      case "Scrubber":
        return TouchBarScrubber(identifier: identifier, withData: touchBarItem)
      default:
        return nil
    }
  }
}
