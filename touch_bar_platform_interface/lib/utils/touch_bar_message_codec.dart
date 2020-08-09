// Copyright (c) 2020 Eduardo Vital Alencar Cunha
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:touch_bar_platform_interface/models/touch_bar_image.dart';

class TouchBarMessageCodec extends StandardMessageCodec {
  /// Constructor
  const TouchBarMessageCodec();

  /// Type discriminators 0 through 127 inclusive are reserved for use by the
  /// base class, so we need add new discriminators starting from 128.
  static const int _kTouchBarImage = 128;

  @override
  void writeValue(WriteBuffer buffer, dynamic value) {
    if (value is TouchBarImage) {
      buffer.putUint8(_kTouchBarImage);

      writeValue(buffer, value.key);

      final Uint8List imageData = value.data.buffer.asUint8List();
      writeSize(buffer, imageData.length);
      buffer.putUint8List(imageData);
    } else {
      super.writeValue(buffer, value);
    }
  }
}