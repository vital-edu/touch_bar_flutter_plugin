// Copyright (c) 2020 Eduardo Vital Alencar Cunha
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

extension NSColor {
  convenience init(fromARGB argb: String) {
    var colors: [CGFloat] = []
    for index in stride(from: 0, to: argb.count, by: 2) {
      let start = argb.index(argb.startIndex, offsetBy: index)
      let end = argb.index(start, offsetBy: 2)
      let decimalRepresentation = Int(argb[start..<end], radix: 16)!
      colors.append(CGFloat(decimalRepresentation) / 255.0)
    }

    self.init(
        red: colors[1],
        green: colors[2],
        blue: colors[3],
        alpha: colors[0]
    )
  }
}
