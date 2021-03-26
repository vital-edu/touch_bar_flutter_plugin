// Copyright (c) 2020 The TouchBar Flutter Plugin Authors
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import Foundation

@available(OSX 10.12.2, *)
protocol TouchBarItem: NSTouchBarItem {
  init?(identifier: NSTouchBarItem.Identifier, withData itemData: NSDictionary);

  func update(data: NSDictionary) -> Void
}
