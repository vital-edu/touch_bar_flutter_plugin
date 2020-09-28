// Copyright (c) 2020 Eduardo Vital Alencar Cunha
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

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
