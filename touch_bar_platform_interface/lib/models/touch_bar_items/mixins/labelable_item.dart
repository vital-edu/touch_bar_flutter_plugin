// Copyright (c) 2020 Eduardo Vital Alencar Cunha
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import 'dart:ui';

import './renderable_item.dart';
import '../../touch_bar_item.dart';
import '../touch_bar_scrubber_item.dart';

part '../touch_bar_label.dart';
part '../touch_bar_scrubber_label.dart';

/// Provides the required properties and methods for touch bar items that
/// behaves like a label.
mixin LabelableItem on RenderableItem {
  String? get label => _label;
  String? get accessibilityLabel => _accessibilityLabel;
  Color? get textColor => _textColor;

  set label(String? newValue) {
    this.updateProperty('label', newValue: newValue);
    this._label = newValue;
  }

  set accessibilityLabel(String? newValue) {
    this.updateProperty('accessibilityLabel', newValue: newValue);
    this._accessibilityLabel = newValue;
  }

  set textColor(Color? newValue) {
    this.updateProperty('color', newValue: newValue);
    this._textColor = newValue;
  }

  /// Label text
  String? _label;

  /// A succinct description of the [TouchBarLabel] used to provide accessibility
  String? _accessibilityLabel;

  /// Color of te label text
  Color? _textColor;

  Map<String, dynamic> toMap() => {
        'id': id,
        'type': type,
        'label': label,
        'accessibilityLabel': accessibilityLabel,
        'color': textColor,
      };
}
