// Copyright (c) 2020 Eduardo Vital Alencar Cunha
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/services.dart';
import 'package:touch_bar_platform_interface/models/touch_bar.dart';
import 'package:touch_bar_platform_interface/touch_bar_platform_interface.dart';
import 'package:touch_bar_platform_interface/utils/touch_bar_message_codec.dart';

const MethodChannel _channel = MethodChannel(
  'plugins.flutter.io/touch_bar',
  StandardMethodCodec(TouchBarMessageCodec()),
);

class TouchBarPlugin extends TouchBarPlatform {
  /// Registers this class as the default instance of [TouchBarPlatform].
  static void registerWith() {
    TouchBarPlatform.instance = TouchBarPlugin();
  }

  /// Invokes setTouchBar Swift implementation
  @override
  setTouchBar(AbstractTouchBar touchBar) {
    _channel.invokeMethod('setTouchBar', touchBar.toMap());
    _channel.setMethodCallHandler((call) async {
      touchBar.callMethod(call.method);
    });

    return null;
  }

  @override
  void setTouchBarItem({
    int id,
    String type,
    Map<String, dynamic> dataChanges,
  }) {
    _channel.invokeMethod('setTouchBarItem', {
      ...dataChanges,
      'id': id,
      'type': type,
    });
  }
}
