// Copyright (c) 2020 Eduardo Vital Alencar Cunha
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

@available(OSX 10.12.2, *)
enum ScrubberSelectionStyle {
  case roundedBackground
  case outlineOverlay
  case none

  init(_ style: String?) {
    switch style {
      case "ScrubberSelectionStyle.roundedBackground":
        self = Self.roundedBackground
      case "ScrubberSelectionStyle.outlineOverlay":
        self = Self.outlineOverlay
      case "ScrubberSelectionStyle.none":
        fallthrough
      default:
        self = Self.none
    }
  }

  func toSelectionStyle() -> NSScrubberSelectionStyle? {
    switch self {
      case .roundedBackground:
        return .roundedBackground
      case .outlineOverlay:
        return .outlineOverlay
      case .none:
        return nil
    }
  }
}
