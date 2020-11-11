// Copyright (c) 2020 Eduardo Vital Alencar Cunha
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter/services.dart';
import 'package:touch_bar_platform_interface/models/touch_bar.dart';
import 'package:touch_bar_platform_interface/touch_bar_platform_interface.dart';
import 'package:touch_bar_platform_interface/utils/touch_bar_message_codec.dart';

const MethodChannel _channel = MethodChannel(
  'plugins.flutter.io/touch_bar',
  StandardMethodCodec(TouchBarMessageCodec()),
);

/// An implementation of [TouchBarPlatform] that uses method channels.
class MethodChannelTouchBar extends TouchBarPlatform {
  @override
  Future<void> setTouchBar(AbstractTouchBar touchBar) {
    _channel.invokeMethod('setTouchBar', touchBar.toMap());
    _channel.setMethodCallHandler((call) async {
      touchBar.callMethod(call.method, call.arguments);
    });

    return null;
  }

  @override
  Future<void> setTouchBarItem({
    int id,
    String type,
    Map<String, dynamic> dataChanges,
  }) {
    return _channel.invokeMethod('setTouchBarItem', {
      ...dataChanges,
      'id': id,
      'type': type,
    });
  }
}
