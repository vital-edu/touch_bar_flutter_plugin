// Copyright (c) 2020 The TouchBar Flutter Plugin Authors
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:touch_bar_platform_interface/models/touch_bar_item.dart';
import 'package:touch_bar_platform_interface/models/touch_bar_items/mixins/callable_item.dart';

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

  /// Searches the method named [name] in the all the TouchBar items
  /// and execute it.
  ///
  /// It returns true if a method of the given [name] was found and executed.
  ///
  /// The [name] has the value of [Identifier.toString()].
  /// It is not a humand readable name nor the name of the property that it
  /// holds.
  ///
  /// The [arguments] can be any value.
  ///
  /// **This method should not be called manually.**
  bool callMethod(String name, dynamic arguments);
}

/// A standard touch bar with no touch bar item.
class TouchBar extends AbstractTouchBar {
  const TouchBar({
    @required List<AbstractTouchBarItem> children,
  }) : super(children);

  @override
  bool callMethod(String name, dynamic arguments) {
    for (AbstractTouchBarItem child in children) {
      if (child is CallableItem && child.callMethod(name, arguments) == true) {
        return true;
      }
    }
    return false;
  }

  @override
  Map<String, dynamic> toMap() => {
        'touch_bar': {
          'children': children.map((item) => item.toMap()).toList(),
        }
      };
}
