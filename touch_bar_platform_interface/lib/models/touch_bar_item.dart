// Copyright (c) 2020 Eduardo Vital Alencar Cunha
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import 'package:meta/meta.dart';
import 'package:touch_bar_platform_interface/models/touch_bar_items/mixins/renderable_item.dart';
import 'package:touch_bar_platform_interface/touch_bar_platform_interface.dart';

int nextTouchBarItemID = 0;

/// The base type touch bar item that can be shown in a touch bar.
abstract class AbstractTouchBarItem with RenderableItem {
  /// Constructor
  ///
  /// [methods] should be nil only if the TouchBarItem has no methods
  /// that will be called in the native platform.
  ///
  /// All the concrete implementation of this that contains actioons that
  /// will be called in the native platform must be implemented following the
  /// example below:
  /// ```dart
  /// class ConcreteTouchBarItem extends AbstractTouchBarItem {
  ///   // [onAction] and [onAnotherAction] store just the hash code of the
  ///   // implementation.
  ///   final String onAction();
  ///   final String onAnotherAction();
  ///
  ///   // [methods] will be used as single source of truth to the
  ///   // implementation and [onAction] and [onAnotherAction] will be
  ///   // used in the [toMap()].
  ///   ConcreteTouchBarItem(Function onAction) :
  ///     this.onAction = onAction.hashCode.toString(),
  ///     this.onAnotherAction = onAction.hashCode.toString(),
  ///     super(methods: {
  ///       '${onAction.hashCode}': onAction,
  ///       '${onAnotherAction.hashCode}': onAnotherAction,
  ///     });
  /// }
  /// ```
  AbstractTouchBarItem({this.methods = const {}});

  /// Searches the method named [name] in this and execute it.
  ///
  /// It returns true if a method of the given [name] was found and executed.
  ///
  /// The [name] has the value of [Function.hashCode].
  /// It is not a humand readable name nor the name of the property that it
  /// holds.
  ///
  /// **This method should not be called manually.**
  bool callMethod(String name) {
    for (String functionName in methods.keys) {
      if (functionName == name) {
        methods[name]();
        return true;
      }
    }

    return false;
  }

  /// Updates the property named [name] with a [newValue].
  ///
  /// **The [name] must be the same used in [this.toMap()]**
  @protected
  void updateProperty(String name, {dynamic newValue}) {
    TouchBarPlatform.instance.setTouchBarItem(
      id: this.id,
      type: this.type,
      dataChanges: {
        name: newValue,
      },
    );
  }

  /// Convert all the TouchBarItem data to a Map that will be used
  /// in the platform channel communication.
  Map<String, dynamic> toMap();

  /// Stores all the methods of this.
  ///
  /// The [Map.keys] stores the hash code of the methods
  /// and [Map.values] stores the method implementation.
  ///
  /// Note: **This should not be included in the [toMap] implementation.**
  final Map<String, Function> methods;
}

/// The base type for touch bar items that do not contain others touchbars.
///
/// Note: the [children] property is forbidden in [this]
/// Use [TouchBarGuardian] or [TouchBarContainer]
/// to be able to use the [children] property.
abstract class TouchBarItem extends AbstractTouchBarItem {
  /// The [children] property is forbbiden in [this].
  final List<TouchBarItem> children = null;

  TouchBarItem({Map<String, Function> methods}) : super(methods: methods);
}

/// It makes touch bar items capable of having children.
mixin _Parenthood on AbstractTouchBarItem {
  List<TouchBarItem> get children => _children;
  set children(List<TouchBarItem> newValue) {
    this.updateProperty(
      'children',
      newValue: newValue.map((item) => item.toMap()).toList(),
    );
    this._children = newValue;
  }

  /// The subitems of [this].
  List<TouchBarItem> _children;
}

/// The base type for touch bar items that can have [children]
/// an also be a child of another touch bar item.
abstract class TouchBarGuardian extends AbstractTouchBarItem with _Parenthood {
  TouchBarGuardian({List<TouchBarItem> children}) {
    this._children = children;
  }
}

/// The base type for touch bar items that can have [children]
/// but cannot be a child of another touch bar item.
abstract class TouchBarContainer extends TouchBarItem with _Parenthood {
  TouchBarContainer({List<TouchBarItem> children}) {
    this._children = children;
  }
}
