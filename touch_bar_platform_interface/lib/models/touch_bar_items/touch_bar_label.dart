// Copyright (c) 2020 Eduardo Vital Alencar Cunha
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import 'dart:ui';

import '../touch_bar_item.dart';

/// A touch bar item with a text with a single style.
class TouchBarLabel extends AbstractTouchBarItem {
  /// Creates a new label item with the given [identifier] and [label].
  TouchBarLabel(this.label, {this.textColor, this.accessibilityLabel})
      : super();

  /// Label text
  final String label;

  /// A succinct description of the label used to provide accessibility
  final String accessibilityLabel;

  /// Color of te label text
  final Color textColor;

  @override
  Map<String, dynamic> toMap() => {
        'type': type,
        'label': label,
        'accessibilityLabel': accessibilityLabel,

        /// Color must be converted to the range [0, 1]
        'color': {
          'red': textColor.red / 256,
          'green': textColor.green / 255,
          'blue': textColor.blue / 255,
          'alpha': textColor.alpha / 255,
        },
      };

  @override
  String get type => "Label";
}
