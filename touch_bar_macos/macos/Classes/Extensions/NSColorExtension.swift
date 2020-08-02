// Copyright (c) 2020 Eduardo Vital Alencar Cunha
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

extension NSColor {
  convenience init?(fromRGBA rgba: NSDictionary?) {
    guard let red = rgba?["red"] as? CGFloat,
      let green = rgba?["green"] as? CGFloat,
      let blue = rgba?["blue"] as? CGFloat,
      let alpha = rgba?["alpha"] as? CGFloat else {
      return nil
    }
    self.init(deviceRed: red, green: green, blue: blue, alpha: alpha)
  }
}
