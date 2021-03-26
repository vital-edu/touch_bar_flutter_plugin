// Copyright (c) 2020 The TouchBar Flutter Plugin Authors
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

struct TouchBarImage {
  let key: String;
  let image: NSImage

  init?(key: String, data: Data) {
    guard let image = NSImage(data: data) else { return nil }

    self.key = key
    self.image = image
  }
}
