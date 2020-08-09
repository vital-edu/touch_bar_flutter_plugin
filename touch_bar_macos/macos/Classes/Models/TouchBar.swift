// Copyright (c) 2020 Eduardo Vital Alencar Cunha
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

class TouchBar: NSTouchBar, NSTouchBarDelegate {
  let touchBarItemFactory = TouchBarItemFactory()
  let items: NSArray

  init(items: NSArray) {
    self.items = items
    super.init()

    let identifiers = (0...((items.count) - 1)).map {
      NSTouchBarItem.Identifier(String($0))
    }

    self.delegate = self
    self.defaultItemIdentifiers = identifiers
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  public func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItem.Identifier) -> NSTouchBarItem? {
    let position = Int(identifier.rawValue) ?? 0

    guard let itemData = self.items.object(at: position) as? NSDictionary else {
      return nil
    }

    return touchBarItemFactory.get(touchBarItem: itemData, withIdentifier: identifier)
  }
}
