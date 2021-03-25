// Copyright (c) 2020 The TouchBar Flutter Plugin Authors
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

class TouchBarImage {
  final String key;
  final ByteData data;

  /// Create an instance of TouchBarImage from an asset [path] with a [key].
  ///
  /// [path] must have the same value defined in the pubspec. Example:
  ///
  /// *in pubspec.yaml:*
  /// ```yaml
  /// assets:
  ///   - assets/icons/myIcon.png
  /// ```
  /// *in the Flutter code:*
  /// ```dart
  /// TouchBarImage(icon: 'assets/icons/myIcon.png')
  /// ```
  ///
  /// [key] must be unique, if none is provided the path will be used as
  /// the [key] value.
  static Future<TouchBarImage> loadFrom({
    @required String path,
    String key,
  }) async {
    assert(path != null && path != '');
    if (key == null) key = path;

    ByteData data = await rootBundle.load(path);
    return TouchBarImage(key: key, data: data);
  }

  /// Create an instance of TouchBarImage with a [key] and [data].
  TouchBarImage({@required this.key, @required this.data});
}
