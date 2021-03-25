// Copyright (c) 2020 The TouchBar Flutter Plugin Authors
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

extension NSColor {
  convenience init(fromARGB argb: String) {
    var colors: [CGFloat] = []
    for index in stride(from: 0, to: argb.count, by: 2) {
      let start = argb.index(argb.startIndex, offsetBy: index)
      let end = argb.index(start, offsetBy: 2, limitedBy: argb.endIndex) ?? argb.endIndex
      let decimalRepresentation = Int(argb[start..<end], radix: 16)!
      colors.append(CGFloat(decimalRepresentation) / 255.0)
    }

    self.init(
      red: colors.indices.contains(1) ? colors[1] : 0,
      green: colors.indices.contains(2) ? colors[2] : 0,
      blue: colors.indices.contains(3) ? colors[3] : 0,
      alpha: colors.indices.contains(0) ? colors[0] : 1
    )
  }
}
