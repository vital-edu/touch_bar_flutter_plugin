// Copyright (c) 2020 Eduardo Vital Alencar Cunha
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/services.dart';
import 'package:touch_bar_platform_interface/models/touch_bar.dart';

import 'touch_bar_platform_interface.dart';

const MethodChannel _channel = MethodChannel('plugins.flutter.io/touch_bar');

/// An implementation of [TouchBarPlatform] that uses method channels.
class MethodChannelTouchBar extends TouchBarPlatform {
  Future<bool> setTouchBar(AbstractTouchBar touchBar) {
    TouchBarPlatform.instance.setTouchBar(touchBar);
  }
}
