// Copyright (c) 2020 Eduardo Vital Alencar Cunha
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import 'dart:ui';

import '../extensions/color_extension.dart';
import '../touch_bar_item.dart';

/// A touch bar item with a text with a single style.
class TouchBarLabel extends TouchBarItem {
  /// Creates a new label item with the given [identifier] and [label].
  TouchBarLabel(this.label, {this.textColor, this.accessibilityLabel})
      : super();

  /// Label text
  final String label;

  /// A succinct description of the [TouchBarLabel] used to provide accessibility
  final String accessibilityLabel;

  /// Color of te label text
  final Color textColor;

  @override
  Map<String, dynamic> toMap() => {
        'type': type,
        'label': label,
        'accessibilityLabel': accessibilityLabel,
        'color': textColor.toRGBA(),
      };

  @override
  String get type => "Label";
}
