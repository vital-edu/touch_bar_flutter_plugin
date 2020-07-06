// Copyright (c) 2020 Eduardo Vital Alencar Cunha
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/services.dart';
import 'package:touch_bar_platform_interface/models/touch_bar.dart';
import 'package:touch_bar_platform_interface/models/touch_bar_item.dart';
import 'package:touch_bar_platform_interface/touch_bar_platform_interface.dart';

const MethodChannel _channel = MethodChannel('plugins.flutter.io/touch_bar');

class TouchBarPlugin extends TouchBarPlatform {
  /// Registers this class as the default instance of [TouchBarPlatform].
  static void registerWith() {
    TouchBarPlatform.instance = TouchBarPlugin();
  }

  @override
  setTouchBar(AbstractTouchBar touchBar) {
    String label = (touchBar.children.first as LabelItem).label;
    return _channel.invokeMethod<bool>(
      'setTouchBar',
      label,
    );
  }
}
