// Copyright (c) 2020 The TouchBar Flutter Plugin Authors
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/services.dart';

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
  /// [key] must be unique, if none is provided the [path] will be used as
  /// the [key] value.
  static Future<TouchBarImage> loadFrom({
    required String path,
    String? key,
  }) async {
    assert(path.isNotEmpty);
    if (key == null) key = path;

    ByteData data = await rootBundle.load(path);
    return TouchBarImage(key: key, data: data);
  }

  /// Create an instance of TouchBarImage from a remote [url] with a [key].
  ///
  /// Example:
  /// ```dart
  /// TouchBarImage(url: 'https://picsum.photos/24')
  /// ```
  ///
  /// [key] must be unique, if none is provided the [url] will be used as
  /// the [key] value.
  static Future<TouchBarImage> loadFromNetwork({
    required Uri url,
    String? key,
  }) async {
    if (key == null) key = url.toString();

    ByteData data = await NetworkAssetBundle(url).load(
      '${url.path}?${url.query}',
    );
    return TouchBarImage(key: key, data: data);
  }

  /// Create an instance of TouchBarImage with a [key] and [data].
  TouchBarImage({required this.key, required this.data});
}
