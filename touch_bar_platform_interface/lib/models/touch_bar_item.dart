// Copyright (c) 2020 Eduardo Vital Alencar Cunha
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

/// The base type for an individual touch bar item that can be shown in a
/// touch bar.
abstract class AbstractTouchBarItem {
  const AbstractTouchBarItem();

  /// Convert all the TouchBarItem data to a Map that will be used
  /// in the platform channel communication
  Map<String, dynamic> toMap();

  /// Name of the concrete implementation of the AbstractTouchBarItem
  /// that will be used to inform the specific platform implementation
  /// which TouchBarItem must be rendered.
  /// This is important because the platform channel communication
  /// is performed through subset of the primitive types.
  /// See https://flutter.dev/docs/development/platform-integration/platform-channels#codec
  String get type;
}
