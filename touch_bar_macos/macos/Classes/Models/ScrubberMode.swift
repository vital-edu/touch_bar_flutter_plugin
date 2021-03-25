// Copyright (c) 2020 The TouchBar Flutter Plugin Authors
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

@available(OSX 10.12.2, *)
enum ScrubberMode {
  case fixed
  case free

  init(_ mode: String) {
    switch mode {
      case "ScrubberMode.fixed":
        self = Self.fixed
      case "ScrubberMode.free":
        fallthrough
      default:
        self = Self.free
    }
  }

  func toMode() -> NSScrubber.Mode {
    switch self {
      case .fixed:
        return .fixed
      case .free:
        return .free
    }
  }
}
