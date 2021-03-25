// Copyright (c) 2020 The TouchBar Flutter Plugin Authors
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:touch_bar_platform_interface/models/touch_bar_items/mixins/callable_item.dart';
import 'package:touch_bar_platform_interface/models/identifier.dart';

import '../labeled_image.dart';
import '../touch_bar_image.dart';
import '../touch_bar_item.dart';

class TouchBarButton extends TouchBarItem with CallableItem {
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
    String accessibilityLabel,
    Color backgroundColor,
    TouchBarImage icon,
    ImagePosition iconPosition,
    VoidCallback onClick,
  })  : this._accessibilityLabel = accessibilityLabel,
        this._backgroundColor = backgroundColor,
        this._labeledIcon = LabeledImage(
          image: icon,
          label: label,
          imagePosition: iconPosition,
        ),
        super() {
    this.onClick = onClick;
  }

  @override
  String get type => "Button";

  TouchBarImage get icon => _labeledIcon.image;
  String get label => _labeledIcon.label;
  ImagePosition get iconPosition => _labeledIcon.imagePosition;
  String get accessibilityLabel => _accessibilityLabel;
  Color get backgroundColor => _backgroundColor;

  set icon(TouchBarImage newValue) {
    updateProperty('icon', newValue: newValue);
    this._labeledIcon.image = newValue;
  }

  set label(String newValue) {
    updateProperty('label', newValue: newValue);
    this._labeledIcon.label = newValue;
  }

  set iconPosition(ImagePosition newValue) {
    updateProperty('iconPosition', newValue: newValue.toString());
    this._labeledIcon.imagePosition = newValue;
  }

  set accessibilityLabel(String newValue) {
    updateProperty('accessibilityLabel', newValue: newValue);
    _accessibilityLabel = newValue;
  }

  set backgroundColor(Color newValue) {
    updateProperty('backgroundColor', newValue: newValue);
    _backgroundColor = newValue;
  }

  set onClick(VoidCallback newValue) {
    // It is necessary to change only the [onClick] implementation.
    // The identifier should remain the same since it is used only to
    // assure uniqueness.
    this.methods['$_onClick'] = newValue;
  }

  /// Icon with label and iconpPosition information.
  LabeledImage _labeledIcon;

  /// A succinct description of the [TouchBarButton] used to provide
  /// accessibility.
  String _accessibilityLabel;

  /// Background color of te [TouchBarButton]
  Color _backgroundColor;

  /// The unique identifier of the method called when the button is clicked.
  ///
  /// The implementation of this method is stored in
  /// [this.methods].
  final Identifier _onClick = Identifier.uniq();

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'type': type,
      'iconPosition': iconPosition.toString(),
    };
    if (label != null) map['label'] = label;
    if (accessibilityLabel != null)
      map['accessibilityLabel'] = accessibilityLabel;
    if (backgroundColor != null) map['backgroundColor'] = backgroundColor;
    if (_onClick != null) map['onClick'] = _onClick;
    if (icon != null) map['icon'] = icon;

    return map;
  }
}
