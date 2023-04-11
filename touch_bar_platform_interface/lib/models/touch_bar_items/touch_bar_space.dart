// Copyright (c) 2020 The TouchBar Flutter Plugin Authors
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import '../touch_bar_item.dart';

enum _TouchBarSpaceSize { small, large, flexible }

extension on _TouchBarSpaceSize {
  String get rawValue {
    switch (this) {
      case _TouchBarSpaceSize.large:
        return 'NSTouchBarItemIdentifierFixedSpaceLarge';
      case _TouchBarSpaceSize.small:
        return 'NSTouchBarItemIdentifierFixedSpaceSmall';
      case _TouchBarSpaceSize.flexible:
        return 'NSTouchBarItemIdentifierFlexibleSpace';
    }
  }
}

class TouchBarSpace extends TouchBarItem {
  TouchBarSpace._({
    _TouchBarSpaceSize size = _TouchBarSpaceSize.small,
  }) : this._size = size;

  final _TouchBarSpaceSize _size;
  _TouchBarSpaceSize get() => this._size;

  Map<String, dynamic> toMap() {
    return {
      'id': _size.rawValue,
    };
  }

  factory TouchBarSpace.small() {
    return TouchBarSpace._(size: _TouchBarSpaceSize.small);
  }

  factory TouchBarSpace.large() {
    return TouchBarSpace._(size: _TouchBarSpaceSize.large);
  }

  factory TouchBarSpace.flexible() {
    return TouchBarSpace._(size: _TouchBarSpaceSize.flexible);
  }

  @override
  String get type => 'Space';
}
