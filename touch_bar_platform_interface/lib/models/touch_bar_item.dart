// Copyright (c) 2020 Eduardo Vital Alencar Cunha
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.
import 'package:flutter/cupertino.dart';

/// The base type for an individual touch bar item that can be shown in a
/// touch bar.
abstract class AbstractTouchBarItem {
  const AbstractTouchBarItem({@required this.identifier});

  /// an unique identifier
  final String identifier;
}

/// A touch bar item with a text with a single style.
class LabelItem extends AbstractTouchBarItem {
  /// Creates a new label item with the given [identifier] and [label].
  const LabelItem({@required identifier, @required this.label})
      : super(identifier: identifier);

  final String label;
}
