// Copyright (c) 2020 Eduardo Vital Alencar Cunha
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import 'dart:ui';

import '../touch_bar_item.dart';

/// A touch bar item with a text with a single style.
class TouchBarLabel extends TouchBarItem {
  /// Creates a new label item with the given [identifier] and [label].
  TouchBarLabel(
    String label, {
    Color textColor,
    String accessibilityLabel,
  })  : this._label = label,
        this._textColor = textColor,
        this._accessibilityLabel = accessibilityLabel,
        super();

  String get label => _label;
  String get accessibilityLabel => _accessibilityLabel;
  Color get textColor => _textColor;

  set label(String newValue) {
    this.updateProperty('label', newValue: newValue);
    this._label = newValue;
  }

  set accessibilityLabel(String newValue) {
    this.updateProperty('accessibilityLabel', newValue: newValue);
    this._accessibilityLabel = newValue;
  }

  set textColor(Color newValue) {
    this.updateProperty('color', newValue: newValue);
    this._textColor = newValue;
  }

  /// Label text
  String _label;

  /// A succinct description of the [TouchBarLabel] used to provide accessibility
  String _accessibilityLabel;

  /// Color of te label text
  Color _textColor;

  @override
  Map<String, dynamic> toMap() => {
        'id': id,
        'type': type,
        'label': label,
        'accessibilityLabel': accessibilityLabel,
        'color': textColor,
      };

  @override
  String get type => "Label";
}
