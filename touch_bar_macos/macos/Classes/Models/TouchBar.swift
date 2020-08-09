// Copyright (c) 2020 Eduardo Vital Alencar Cunha
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

class TouchBar: NSTouchBar, NSTouchBarDelegate {
  let touchBarItemFactory = TouchBarItemFactory()
  let items: NSArray

  init(items: NSArray) {
    self.items = items
    super.init()

    let identifiers = items.map { (item) -> NSTouchBarItem.Identifier in
      let id = (item as! NSDictionary)["id"] as! Int
      return NSTouchBarItem.Identifier(String(id))
    }

    self.delegate = self
    self.defaultItemIdentifiers = identifiers
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  public func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItem.Identifier) -> NSTouchBarItem? {
    let id = Int(identifier.rawValue)

    guard case let itemData as NSDictionary = self.items.first(where: { ($0 as! NSDictionary)["id"] as? Int == id }) else {
      return nil
    }

    return touchBarItemFactory.get(touchBarItem: itemData, withIdentifier: identifier)
  }
}
