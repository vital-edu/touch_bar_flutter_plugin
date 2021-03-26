// Copyright (c) 2020 The TouchBar Flutter Plugin Authors
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import 'package:touch_bar_platform_interface/models/labeled_image.dart';
import 'package:touch_bar_platform_interface/models/touch_bar_image.dart';
import 'package:touch_bar_platform_interface/models/touch_bar_item.dart';

class TouchBarPopover extends TouchBarGuardian {
  /// Creates a new [TouchBarPopover] item with the giver [label], [icon],
  /// [iconPosition] and [showCloseButton]
  TouchBarPopover({
    String? label,
    TouchBarImage? icon,
    bool? showCloseButton,
    ImagePosition? iconPosition,
    List<TouchBarItem>? children,
  })  : this._labeledIcon = LabeledImage(
          image: icon,
          label: label,
          imagePosition: iconPosition,
        ),
        this._showCloseButton = showCloseButton,
        super(children: children);

  String? get label => _labeledIcon?.label;
  TouchBarImage? get icon => _labeledIcon?.image;
  ImagePosition? get iconPosition => _labeledIcon?.imagePosition;
  bool? get showCloseButton => _showCloseButton;

  set label(String? newValue) {
    this.updateProperty('label', newValue: newValue);
    this._labeledIcon?.label = newValue;
  }

  set icon(TouchBarImage? newValue) {
    this.updateProperty('icon', newValue: newValue);
    this._labeledIcon?.image = newValue;
  }

  set iconPosition(ImagePosition? newValue) {
    this.updateProperty('iconPosition', newValue: newValue.toString());
    this._labeledIcon?.imagePosition = newValue;
  }

  set showCloseButton(bool? newValue) {
    this.updateProperty('showCloseButton', newValue: newValue);
    this._showCloseButton = newValue;
  }

  /// Icon with label and iconpPosition information.
  LabeledImage? _labeledIcon;

  /// Determines if the popover when opened will show a native close icon.
  bool? _showCloseButton;

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'type': type,
      'children': children?.map((item) => item.toMap()).toList(),
      'showCloseButton': showCloseButton,
      'iconPosition': iconPosition.toString(),
    };
    if (label != null) map['label'] = label;
    if (icon != null) map['icon'] = icon;
    return map;
  }

  @override
  String get type => 'Popover';
}
