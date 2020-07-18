// Copyright (c) 2020 Eduardo Vital Alencar Cunha
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:touch_bar_platform_interface/models/touch_bar_item.dart';

import '../extensions/color_extension.dart';

class TouchBarButton extends AbstractTouchBarItem {
  /// Creates a new [TouchBarButton] item with the given [label],
  /// [accessibilityLabel], [backgroundColor], [icon], and [onClick].
  TouchBarButton({
    this.label,
    this.accessibilityLabel,
    this.backgroundColor,
    this.icon,
    Function onClick,
  })  : this.onClick = onClick.hashCode.toString(),
        super(methods: {'${onClick.hashCode}': onClick});

  /// [TouchBarButton] label text
  final String label;

  /// A succinct description of the [TouchBarButton] used to provide accessibility
  final String accessibilityLabel;

  /// Background color of te [TouchBarButton]
  final Color backgroundColor;

  /// The position of the icon in relation to the label.
  /// It defaults to `left`
  final IconPosition iconPosition = IconPosition.left;

  /// TODO(vital-edu): Implement support for native image
  /// Button icon
  final String icon;

  /// The hash code of the method called when the button is clicked.
  ///
  /// The implementation of this method is stored in
  /// [AbstractTouchBarItem.methods].
  final String onClick;

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'type': type,
      'iconPosition': iconPosition.toString(),
    };
    if (label != null) map['label'] = label;
    if (accessibilityLabel != null)
      map['accessibilityLabel'] = accessibilityLabel;
    if (backgroundColor != null)
      map['backgroundColor'] = backgroundColor.toRGBA();
    if (onClick != null) map['onClick'] = onClick;

    return map;
  }

  @override
  String get type => "Button";
}

/// The position of the icon in relation to the label.
enum IconPosition {
  /// The image is to the left of the title.
  left,

  /// The image is to the right of the title.
  right,

  /// The image overlaps the title.
  overlaps,
}
