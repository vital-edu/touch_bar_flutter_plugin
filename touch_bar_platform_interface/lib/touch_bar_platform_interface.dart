// Copyright (c) 2020 The TouchBar Flutter Plugin Authors
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:touch_bar_platform_interface/method_channel_touch_bar.dart';
import 'package:touch_bar_platform_interface/models/touch_bar.dart';
import 'package:touch_bar_platform_interface/models/touch_bar_item.dart';

/// The interface that implementations of touch_bar must implement.
///
/// Platform implementations should extend this class rather than implement it as `touch_bar`
/// does not consider newly added methods to be breaking changes. Extending this class
/// (using `extends`) ensures that the subclass will get the default implementation, while
/// platform implementations that `implements` this interface will be broken by newly added
/// [TouchBarPlatform] methods.
abstract class TouchBarPlatform extends PlatformInterface {
  /// Constructs a TouchBarPlatform.
  TouchBarPlatform() : super(token: _token);

  static final Object _token = Object();

  static TouchBarPlatform _instance = MethodChannelTouchBar();

  /// The default instance of [TouchBarPlatform] to use.
  ///
  /// Defaults to [MethodChannelTouchBar].
  static TouchBarPlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [TouchBarPlatform] when they register themselves.
  static set instance(TouchBarPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Sets the touchBar for the current window.
  /// Specifying `null` clears the touch bar.
  Future<void> setTouchBar(AbstractTouchBar touchBar) {
    throw UnimplementedError('setTouchBar() has not been implemented.');
  }

  /// Change the data of the [TouchBarItem] of the given [id] and [type]
  /// with the new data provided by [dataChanges].
  ///
  /// The [dataChanges] must contain all the data that need to be changed.
  /// Do not provide data unless it must be changed.
  ///
  /// The [dataChanges] must be in the format:
  /// ```dart
  /// {
  ///   'propertyOneName': newValue,
  ///   // others properties that must be changed
  /// }
  /// ```
  ///
  void setTouchBarItem({
    int id,
    String type,
    Map<String, dynamic> dataChanges,
  }) {
    throw UnimplementedError('setTouchBar() has not been implemented.');
  }
}
