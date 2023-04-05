// Copyright (c) 2020 The TouchBar Flutter Plugin Authors
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import 'package:touch_bar_platform_interface/models/touch_bar_items/mixins/callable_item.dart';
import 'package:touch_bar_platform_interface/models/identifier.dart';

import '../touch_bar_item.dart';
import 'touch_bar_scrubber_item.dart';

typedef void OnItemAction(int itemIndex);
enum ScrubberMode { fixed, free }
enum ScrubberSelectionStyle { roundedBackground, outlineOverlay, none }

class TouchBarScrubber extends TouchBarContainer with CallableItem {
  TouchBarScrubber({
    required List<TouchBarScrubberItem> children,
    OnItemAction? onSelect,
    OnItemAction? onHighlight,
    bool showArrowButtons = false,
    ScrubberSelectionStyle selectedStyle = ScrubberSelectionStyle.none,
    ScrubberSelectionStyle overlayStyle = ScrubberSelectionStyle.none,
    ScrubberMode mode = ScrubberMode.free,
    bool isContinuous = true,
    bool shouldUnselectAfterHit = false,
  })  : assert(children.length != 0),
        this._selectedStyle = selectedStyle,
        this._overlayStyle = overlayStyle,
        this._showArrowButtons = showArrowButtons,
        this._mode = mode,
        this._isContinuous = isContinuous,
        this._shouldUnselectAfterHit = shouldUnselectAfterHit,
        super(children: children) {
    this.onSelect = onSelect!;
    this.onHighlight = onHighlight!;
  }

  /// The unique identifier of the method called when the item is selected.
  ///
  /// The implementation of this method is stored in
  /// [this.methods].
  final Identifier _onSelect = Identifier.uniq();

  /// The unique identifier of the method called when the item is highlighted.
  ///
  /// The implementation of this method is stored in
  /// [this.methods].
  final Identifier _onHighlight = Identifier.uniq();

  bool _showArrowButtons;
  ScrubberSelectionStyle _selectedStyle;
  ScrubberSelectionStyle _overlayStyle;
  ScrubberMode _mode;
  bool _isContinuous;
  bool _shouldUnselectAfterHit;

  bool get showArrowButtons => _showArrowButtons;
  ScrubberSelectionStyle get selectedStyle => _selectedStyle;
  ScrubberSelectionStyle get overlayStyle => _overlayStyle;
  ScrubberMode get mode => _mode;
  bool get isContinuous => _isContinuous;
  bool get shouldUnselectAfterHit => _shouldUnselectAfterHit;

  set onSelect(OnItemAction newValue) {
    // It is necessary to change only the [onSelect] implementation.
    // The identifier should remain the same since it is used only to
    // assure uniqueness.
    this.methods['$_onSelect'] = newValue;
  }

  set onHighlight(OnItemAction newValue) {
    // It is necessary to change only the [onHighlight] implementation.
    // The identifier should remain the same since it is used only to
    // assure uniqueness.
    this.methods['$_onHighlight'] = newValue;
  }

  set showArrowButtons(bool newValue) {
    this.updateProperty('showArrowButtons', newValue: newValue);
    _showArrowButtons = newValue;
  }

  set selectedStyle(ScrubberSelectionStyle newValue) {
    this.updateProperty('selectedStyle', newValue: newValue.toString());
    _selectedStyle = newValue;
  }

  set overlayStyle(ScrubberSelectionStyle newValue) {
    this.updateProperty('overlayStyle', newValue: newValue.toString());
    _overlayStyle = newValue;
  }

  set mode(ScrubberMode newValue) {
    this.updateProperty('mode', newValue: newValue.toString());
    _mode = newValue;
  }

  set isContinuos(bool newValue) {
    this.updateProperty('isContinuos', newValue: newValue);
    _isContinuous = newValue;
  }

  set shouldUnselectAfterHit(bool newValue) {
    this.updateProperty('shouldUnselectAfterHit', newValue: newValue);
    _shouldUnselectAfterHit = newValue;
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'type': type,
      'children': children?.map((item) => item.toMap()).toList(),
    };
    map['onSelect'] = _onSelect;
    map['onHighlight'] = _onHighlight;
    map['showArrowButtons'] = showArrowButtons;
    map['selectedStyle'] = selectedStyle.toString();
    map['overlayStyle'] = overlayStyle.toString();
    map['mode'] = mode.toString();
    map['isContinuous'] = isContinuous;
    map['shouldUnselectAfterHit'] = shouldUnselectAfterHit;

    return map;
  }

  @override
  String get type => 'Scrubber';
}
