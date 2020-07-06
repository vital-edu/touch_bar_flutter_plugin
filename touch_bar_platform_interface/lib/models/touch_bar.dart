// Copyright (c) 2020 Eduardo Vital Alencar Cunha
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:touch_bar_platform_interface/models/touch_bar_item.dart';

/// The base type for a touch bar.
abstract class AbstractTouchBar {
  /// Creates a new menu item with the give label.
  const AbstractTouchBar(this.children);

  /// Touch bar items to be displayed in the touch bar.
  final List<AbstractTouchBarItem> children;
}

/// A standard touch bar with no touch bar item.
class TouchBar extends AbstractTouchBar {
  /// Creates a new touch bar with the given touch bar items.
  const TouchBar({
    @required List<AbstractTouchBarItem> children,
  }) : super(children);
}
