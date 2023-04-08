// Copyright (c) 2020 The TouchBar Flutter Plugin Authors
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/services.dart';
import 'package:touch_bar_platform_interface/models/touch_bar_image.dart';
import 'package:touch_bar_platform_interface/models/identifier.dart';

class TouchBarMessageCodec extends StandardMessageCodec {
  /// Constructor
  const TouchBarMessageCodec();

  /// Type discriminators 0 through 127 inclusive are reserved for use by the
  /// base class, so we need add new discriminators starting from 128.
  static const int _kTouchBarImage = 128;
  static const int _kTouchBarColor = 129;
  static const int _kTouchBarUniqueId = 130;

  @override
  void writeValue(WriteBuffer buffer, dynamic value) {
    if (value is Color) {
      buffer.putUint8(_kTouchBarColor);

      super.writeValue(buffer, value.value);
    } else if (value is TouchBarImage) {
      buffer.putUint8(_kTouchBarImage);

      writeValue(buffer, value.key);

      final Uint8List imageData = value.data.buffer.asUint8List();
      writeSize(buffer, imageData.length);
      buffer.putUint8List(imageData);
    } else if (value is Identifier) {
      buffer.putUint8(_kTouchBarUniqueId);

      writeValue(buffer, value.toString());
    } else {
      super.writeValue(buffer, value);
    }
  }
}
