// Copyright (c) 2020 Eduardo Vital Alencar Cunha
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import Foundation

protocol TouchBarItem: NSTouchBarItem {
  init?(identifier: NSTouchBarItem.Identifier, withData itemData: NSDictionary);
}
