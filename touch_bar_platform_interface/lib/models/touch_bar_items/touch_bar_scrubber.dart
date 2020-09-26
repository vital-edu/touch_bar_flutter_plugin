// Copyright (c) 2020 Eduardo Vital Alencar Cunha
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import 'package:meta/meta.dart';

import '../touch_bar_item.dart';
import 'touch_bar_scrubber_item.dart';

typedef void OnItemAction(int itemIndex);
enum ScrubberMode { fixed, free }
enum ScrubberSelectionStyle { roundedBackground, outlineOverlay, none }

class TouchBarScrubber extends TouchBarContainer {
  TouchBarScrubber({
    @required List<TouchBarScrubberItem> children,
    OnItemAction onSelect,
    OnItemAction onHighlight,
    bool showArrowButtons = false,
    ScrubberSelectionStyle selectedStyle = ScrubberSelectionStyle.none,
    ScrubberSelectionStyle overlayStyle = ScrubberSelectionStyle.none,
    ScrubberMode mode = ScrubberMode.free,
    bool isContinuous = true,
  })  : assert(children.length != 0),
        this._selectedStyle = selectedStyle,
        this._overlayStyle = overlayStyle,
        this._onSelect = onSelect.hashCode.toString(),
        this._onHighlight = onHighlight.hashCode.toString(),
        this._showArrowButtons = showArrowButtons,
        this._mode = mode,
        this._isContinuous = isContinuous,
        super(children: children);

  /// The hash code of the method called when the item is selected.
  ///
  /// The implementation of this method is stored in
  /// [AbstractTouchBarItem.methods].
  String _onSelect;

  /// The hash code of the method called when the item is selected.
  ///
  /// The implementation of this method is stored in
  /// [AbstractTouchBarItem.methods].
  String _onHighlight;

  bool _showArrowButtons;
  ScrubberSelectionStyle _selectedStyle;
  ScrubberSelectionStyle _overlayStyle;
  ScrubberMode _mode;
  bool _isContinuous;

  bool get showArrowButtons => _showArrowButtons;
  ScrubberSelectionStyle get selectedStyle => _selectedStyle;
  ScrubberSelectionStyle get overlayStyle => _overlayStyle;
  ScrubberMode get mode => _mode;
  bool get isContinuous => _isContinuous;

  set onSelect(Function newValue) {
    // It is necessary to change only the [onSelect] implementation.
    // The hashcode should remain the same since it is used only to
    // assure uniqueness.
    this.methods['$_onSelect'] = newValue;
  }

  set onHighlight(Function newValue) {
    // It is necessary to change only the [onHighlight] implementation.
    // The hashcode should remain the same since it is used only to
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

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'type': type,
      'children': children.map((item) => item.toMap()).toList(),
    };
    // if (onSelect != null) map['onSelect'] = onSelect;
    // if (onHighlight != null) map['onHighlight'] = onHighlight;
    if (showArrowButtons != null) map['showArrowButtons'] = showArrowButtons;
    if (selectedStyle != null) map['selectedStyle'] = selectedStyle.toString();
    if (overlayStyle != null) map['overlayStyle'] = overlayStyle.toString();
    if (mode != null) map['mode'] = mode.toString();
    if (isContinuous != null) map['isContinuous'] = isContinuous;

    return map;
  }

  @override
  String get type => 'Scrubber';
}
