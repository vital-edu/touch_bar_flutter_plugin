// Copyright (c) 2020 Eduardo Vital Alencar Cunha
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import 'package:meta/meta.dart';
import 'package:touch_bar_platform_interface/touch_bar_platform_interface.dart';

int nextTouchBarItemID = 0;

/// Provides the required properties and methods for touch bar items be
/// rendered and updated in the native platform.
mixin RenderableItem {
  /// Updates the property named [name] with a [newValue].
  ///
  /// **The [name] must be the same used in [this.toMap()]**
  @protected
  void updateProperty(String name, {dynamic newValue}) {
    TouchBarPlatform.instance.setTouchBarItem(
      id: this.id,
      type: this.type,
      dataChanges: {
        name: newValue,
      },
    );
  }

  /// The unique sequential identifier of [this].
  ///
  /// Note: **This must be included in the [toMap] implementation.**
  @protected
  final int id = nextTouchBarItemID++;

  /// Name of the touch bar item type
  /// that will be used to inform the specific platform implementation
  /// which TouchBarItem must be rendered/updated.
  /// This is important because the platform channel communication
  /// is performed through subset of the primitive types.
  /// See https://flutter.dev/docs/development/platform-integration/platform-channels#codec.
  @protected
  String get type;
}
