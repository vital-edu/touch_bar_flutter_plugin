// Copyright (c) 2020 Eduardo Vital Alencar Cunha
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import 'package:touch_bar_platform_interface/models/labeled_image.dart';
import 'package:touch_bar_platform_interface/models/touch_bar_image.dart';
import 'package:touch_bar_platform_interface/models/touch_bar_item.dart';

class TouchBarPopover extends TouchBarWrapper {
  /// Creates a new [TouchBarPopover] item with the giver [label], [icon],
  /// [iconPosition] and [showCloseButton]
  TouchBarPopover({
    String label,
    TouchBarImage icon,
    this.showCloseButton,
    ImagePosition iconPosition,
    List<TouchBarItem> children,
  })  : this.labeledIcon = LabeledImage(
          image: icon,
          label: label,
          imagePosition: iconPosition,
        ),
        super(children: children);

  /// Icon with label and iconpPosition information.
  final LabeledImage labeledIcon;

  /// Determines if the popover when opened will show a native close icon.
  final bool showCloseButton;

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'type': type,
      'children': children.map((item) => item.toMap()).toList(),
      'showCloseButton': showCloseButton,
      'imagePosition': labeledIcon.imagePosition.toString(),
    };
    if (labeledIcon.label != null) map['label'] = labeledIcon.label;
    if (labeledIcon.image != null) map['icon'] = labeledIcon.image;
    return map;
  }

  @override
  String get type => 'Popover';
}
