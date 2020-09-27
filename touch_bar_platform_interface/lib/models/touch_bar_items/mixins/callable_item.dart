// Copyright (c) 2020 Eduardo Vital Alencar Cunha
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import '../../touch_bar_item.dart';

/// Provides the required methods for touch bar items that
/// have methods or children that can have methods.
///
/// All the classes that uses this mixin must have its actions implemented
/// following the example below:
/// ```dart
/// class ClassWithAction extends AbstractTouchBarItem with CallableItem {
///   // [onAction] store just an unique identifier of the implementation.
///   final Identifier _onAction = Identifier.uniq();
///
///   // The setter will change only the implementation stored in [methods].
///   set onAction(Function newValue) {
///     this.methods['$_onAction'] = newValue;
///   }
///
///   // [methods] will be used as single source of truth to the
///   // implementation and [_onAction] will be
///   // used in the [toMap()].
///   ClassWithAction(Function onAction) :  super() {
///     this.onAction = onAction;
///   }
/// }
/// ``
mixin CallableItem on AbstractTouchBarItem {
  /// Searches the method named [name] in this and execute it.
  ///
  /// It returns true if a method of the given [name] was found and executed.
  ///
  /// The [name] has the value of [Identifier.toString()].
  /// It is not a human readable name nor the name of the property that it
  /// holds.
  ///
  /// **This method should not be called manually.**
  bool callMethod(String name, dynamic arguments) {
    Function implementation = methods[name];
    if (implementation != null) {
      if (arguments == null) {
        methods[name]();
      } else {
        methods[name](arguments);
      }
      return true;
    }

    if (children == null) return false;

    for (AbstractTouchBarItem child in children) {
      if (child is CallableItem && child.callMethod(name, arguments) == true) {
        return true;
      }
    }

    return false;
  }
}
