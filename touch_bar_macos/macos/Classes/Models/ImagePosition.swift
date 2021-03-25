// Copyright (c) 2020 The TouchBar Flutter Plugin Authors
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

// A subset of the NSControl.ImagePosition
enum ImagePosition: UInt {
  case noImage = 0
  case imageOnly = 1
  case left = 2
  case right = 3
  case overlaps = 6

  init(_ position: String) {
    switch position {
      case "ImagePosition.noImage":
        self = Self.noImage
      case "ImagePosition.imageOnly":
        self = Self.imageOnly
      case "ImagePosition.right":
        self = Self.right
      case "ImagePosition.overlaps":
        self = Self.overlaps
      default:
        self = Self.left
    }
  }

  func toImagePosition() -> NSControl.ImagePosition {
    return NSControl.ImagePosition(rawValue: self.rawValue)!
  }
}
