// Copyright (c) 2020 Eduardo Vital Alencar Cunha
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

part of 'package:touch_bar_platform_interface/models/touch_bar_items/mixins/labelable_item.dart';

/// A touch bar item with a text with a single style.
class TouchBarLabel extends TouchBarItem with LabelableItem {
  /// Creates a new label item with the given [identifier] and [label].
  TouchBarLabel(
    String label, {
    Color textColor,
    String accessibilityLabel,
  }) {
    this._label = label;
    this._textColor = textColor;
    this._accessibilityLabel = accessibilityLabel;
  }

  @override
  String get type => "Label";
}
