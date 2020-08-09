// Copyright (c) 2020 Eduardo Vital Alencar Cunha
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import 'package:touch_bar_platform_interface/models/touch_bar.dart';
import 'package:touch_bar_platform_interface/touch_bar_platform_interface.dart';

export 'package:touch_bar_platform_interface/models/touch_bar.dart';
export 'package:touch_bar_platform_interface/models/touch_bar_image.dart';
export 'package:touch_bar_platform_interface/models/touch_bar_items/touch_bar_button.dart';
export 'package:touch_bar_platform_interface/models/touch_bar_items/touch_bar_label.dart';
export 'package:touch_bar_platform_interface/models/labeled_image.dart'
    show ImagePosition;

Future<void> setTouchBar(TouchBar touchBar) {
  return TouchBarPlatform.instance.setTouchBar(touchBar);
}
