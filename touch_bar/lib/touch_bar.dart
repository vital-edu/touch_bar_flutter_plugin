// Copyright (c) 2020 Eduardo Vital Alencar Cunha
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import 'package:touch_bar_platform_interface/models/touch_bar.dart';
import 'package:touch_bar_platform_interface/touch_bar_platform_interface.dart';

export 'package:touch_bar_platform_interface/models/touch_bar.dart';
export 'package:touch_bar_platform_interface/models/touch_bar_image.dart';
export 'package:touch_bar_platform_interface/models/touch_bar_items/touch_bar_button.dart';
export 'package:touch_bar_platform_interface/models/touch_bar_items/mixins/labelable_item.dart';
export 'package:touch_bar_platform_interface/models/touch_bar_items/touch_bar_popover.dart';
export 'package:touch_bar_platform_interface/models/touch_bar_item.dart'
    show TouchBarItem;
export 'package:touch_bar_platform_interface/models/labeled_image.dart'
    show ImagePosition;
export 'package:touch_bar_platform_interface/models/touch_bar_items/touch_bar_scrubber.dart'
    show TouchBarScrubber, ScrubberMode, ScrubberSelectionStyle;
export 'package:touch_bar_platform_interface/models/touch_bar_items/touch_bar_scrubber_image.dart';
export 'package:touch_bar_platform_interface/models/touch_bar_items/touch_bar_scrubber_item.dart';

Future<void> setTouchBar(TouchBar touchBar) {
  return TouchBarPlatform.instance.setTouchBar(touchBar);
}
