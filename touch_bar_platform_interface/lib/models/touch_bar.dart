// Copyright (c) 2020 Eduardo Vital Alencar Cunha
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:touch_bar_platform_interface/models/touch_bar_item.dart';

/// The base type for a touch bar.
abstract class AbstractTouchBar {
  /// Creates a new TouchBar.
  /// [children] are the items of the menu.
  /// If [children] is empty, a blank touch bar will be rendered
  const AbstractTouchBar(this.children);

  /// Touch bar items to be displayed in the touch bar.
  final List<AbstractTouchBarItem> children;

  /// Convert all the class data to a Map that will be used
  /// in the platform channel communication
  Map<String, dynamic> toMap();
}

/// A standard touch bar with no touch bar item.
class TouchBar extends AbstractTouchBar {
  const TouchBar({
    @required List<AbstractTouchBarItem> children,
  }) : super(children);

  @override
  Map<String, dynamic> toMap() => {
        'touch_bar': {
          'children': children.map((item) => item.toMap()).toList(),
        }
      };
}
