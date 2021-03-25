// Copyright (c) 2020 The TouchBar Flutter Plugin Authors
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

part of 'mixins/labelable_item.dart';

class TouchBarScrubberLabel extends TouchBarScrubberItem with LabelableItem {
  TouchBarScrubberLabel(
    String label, {
    Color textColor,
    String accessibilityLabel,
  }) {
    this._label = label;
    this._textColor = textColor;
    this._accessibilityLabel = accessibilityLabel;
  }

  @override
  String get type => "ScrubberLabel";
}
