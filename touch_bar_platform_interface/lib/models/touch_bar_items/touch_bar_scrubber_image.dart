// Copyright (c) 2020 The TouchBar Flutter Plugin Authors
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import '../touch_bar_image.dart';
import 'touch_bar_scrubber_item.dart';

class TouchBarScrubberImage extends TouchBarScrubberItem {
  TouchBarScrubberImage(TouchBarImage image) : this._image = image;

  TouchBarImage get image => _image;
  set icon(TouchBarImage newValue) {
    updateProperty('image', newValue: newValue);
    this._image = newValue;
  }

  TouchBarImage _image;
  String get type => "ScrubberImage";

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'image': image,
    };
  }
}
