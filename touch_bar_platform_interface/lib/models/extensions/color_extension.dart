// Copyright (c) 2020 Eduardo Vital Alencar Cunha
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import 'dart:ui';

extension ColorExtension on Color {
  /// Convert [Color] to a Map with [red], [green], [blue] and [alpha] values
  /// ranging from 0 to 1
  Map<String, double> toRGBA() => {
        'red': this.red / 255,
        'green': this.green / 255,
        'blue': this.blue / 255,
        'alpha': this.alpha / 255,
      };
}
