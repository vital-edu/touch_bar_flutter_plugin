// Copyright (c) 2020 Eduardo Vital Alencar Cunha
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import 'dart:ui';

import 'package:flutter/widgets.dart';

import '../extensions/color_extension.dart';
import '../labeled_image.dart';
import '../touch_bar_image.dart';
import '../touch_bar_item.dart';

class TouchBarButton extends TouchBarItem {
  /// Creates a new [TouchBarButton] item with the given [label],
  /// [accessibilityLabel], [backgroundColor], [icon], [iconPosition]
  /// and [onClick].
  ///
  /// [iconPosition] is set to (the first condition to match will be applied):
  /// - [ImagePosition.noImage] if [icon] is null;
  /// - [ImagePosition.imageOnly] if [label] is null;
  /// - [ImagePosition.left] if [iconPosition] is null;
  /// - otherwise the [iconPosition] value will be used.
  TouchBarButton({
    String label,
    this.accessibilityLabel,
    this.backgroundColor,
    TouchBarImage icon,
    ImagePosition iconPosition,
    Function onClick,
  })  : this.onClick = onClick.hashCode.toString(),
        this.labeledIcon = LabeledImage(
          image: icon,
          label: label,
          imagePosition: iconPosition,
        ),
        super(methods: {'${onClick.hashCode}': onClick});

  @override
  String get type => "Button";

  /// Icon with label and iconpPosition information.
  final LabeledImage labeledIcon;

  /// A succinct description of the [TouchBarButton] used to provide
  /// accessibility.
  final String accessibilityLabel;

  /// Background color of te [TouchBarButton]
  final Color backgroundColor;

  /// The hash code of the method called when the button is clicked.
  ///
  /// The implementation of this method is stored in
  /// [AbstractTouchBarItem.methods].
  final String onClick;

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'type': type,
      'ImagePosition': labeledIcon.imagePosition.toString(),
    };
    if (labeledIcon.label != null) map['label'] = labeledIcon.label;
    if (accessibilityLabel != null)
      map['accessibilityLabel'] = accessibilityLabel;
    if (backgroundColor != null)
      map['backgroundColor'] = backgroundColor.toRGBA();
    if (onClick != null) map['onClick'] = onClick;
    if (labeledIcon.image != null) map['icon'] = labeledIcon.image;

    return map;
  }
}
