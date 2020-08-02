// Copyright (c) 2020 Eduardo Vital Alencar Cunha
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:touch_bar_platform_interface/models/touch_bar_image.dart';
import 'package:touch_bar_platform_interface/models/touch_bar_item.dart';

import '../extensions/color_extension.dart';

class TouchBarButton extends AbstractTouchBarItem {
  /// Creates a new [TouchBarButton] item with the given [label],
  /// [accessibilityLabel], [backgroundColor], [icon], [iconPosition]
  /// and [onClick].
  ///
  /// [IconPosition] is set to (the first condition to match will be applied):
  /// - [IconPosition.noImage] if [icon] is null;
  /// - [IconPosition.imageOnly] if [label] is null;
  /// - [IconPosition.left] if [iconPosition] is null;
  /// - otherwise the [iconPosition] value will be used.
  TouchBarButton({
    this.label,
    this.accessibilityLabel,
    this.backgroundColor,
    this.icon,
    IconPosition iconPosition,
    Function onClick,
  })  : this.onClick = onClick.hashCode.toString(),
        this.iconPosition = _determineIconPosition(
          label: label,
          icon: icon,
          defaultPosition: iconPosition,
        ),
        super(methods: {'${onClick.hashCode}': onClick});

  /// [TouchBarButton] label text
  final String label;

  /// A succinct description of the [TouchBarButton] used to provide accessibility
  final String accessibilityLabel;

  /// Background color of te [TouchBarButton]
  final Color backgroundColor;

  /// The position of the icon in relation to the label.
  final IconPosition iconPosition;

  /// Button icon
  final TouchBarImage icon;

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
    if (icon != null) map['icon'] = icon;

    return map;
  }

  @override
  String get type => "Button";

  /// Determine the value of [iconPosition] based on [label], [icon] and
  /// [defaultPosition].
  static IconPosition _determineIconPosition({
    @required String label,
    @required TouchBarImage icon,
    @required IconPosition defaultPosition,
  }) {
    if (icon == null) return IconPosition.noImage;
    if (label == null) return IconPosition.imageOnly;
    if (defaultPosition == null) return IconPosition.left;

    return defaultPosition;
  }
}

/// The position of the icon in relation to the label.
enum IconPosition {
  /// The image is not shown.
  noImage,

  /// The label is not shown.
  imageOnly,

  /// The image is to the left of the label.
  left,

  /// The image is to the right of the label.
  right,

  /// The image overlaps the label.
  overlaps,
}
