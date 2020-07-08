// Copyright (c) 2020 Eduardo Vital Alencar Cunha
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.
import 'package:flutter/cupertino.dart';

/// The base type for an individual touch bar item that can be shown in a
/// touch bar.
abstract class AbstractTouchBarItem {
  const AbstractTouchBarItem();

  /// generates JSON data of TouchBar
  /// to be passed through the platform channels
  Map<String, dynamic> toJson();
}

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
  Map<String, dynamic> toJson() => {
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
}
