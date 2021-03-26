// Copyright (c) 2020 The TouchBar Flutter Plugin Authors
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import 'dart:math';

/// Identifier
class Identifier {
  final String _this;

  /// Private constructor.
  Identifier._(this._this);

  /// Generates an alphanumeric string of length 16
  /// used to uniquely identify an object.
  ///
  /// The string is compounded by two parts:
  /// - The first part represents the microseconds since the 'Unix epoch'
  /// from the time it was generated converted to radix 36.
  /// - The second part is randomly generated numbers of radix 36.
  ///
  /// The first part of the string can have the maximum length of 11,
  /// thus the randomly-generated part is at least 5 characters long.
  factory Identifier.uniq() {
    final time = DateTime.now().microsecondsSinceEpoch.toRadixString(36);
    final extraChars = 16 - time.length;
    final maxRadix = 36; // 10 numbers and 23 letters.

    var random = Random.secure();

    var randomBitsBuffer = StringBuffer(time)
      ..writeAll(
        List.generate(
          extraChars,
          (idx) => random.nextInt(maxRadix).toRadixString(maxRadix),
        ),
      );

    return Identifier._(randomBitsBuffer.toString());
  }

  @override
  String toString() {
    return _this;
  }
}
