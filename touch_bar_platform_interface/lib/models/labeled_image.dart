// Copyright (c) 2020 Eduardo Vital Alencar Cunha
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'touch_bar_image.dart';

/// The position of the image in relation to the label in the [LabeledImage].
enum ImagePosition {
  /// The image is not shown.
  noImage,

  /// The label is not shown.
  imageOnly,

  /// The image is to the left of the label.
  left,

  /// The image is to the right of the label.
  right,

  /// The image overlaps the label.
  overlaps,
}

/// Stores a [label], [image], and the [imagePosition].
class LabeledImage {
  final String label;
  final TouchBarImage image;
  final ImagePosition imagePosition;

  /// Creates an instance of a [LabeledImage] with the given [image], [label]
  /// and [imagePosition].
  ///
  /// [ImagePosition] is set to (the first condition to match will be applied):
  /// - [ImagePosition.noImage] if [icon] is null;
  /// - [ImagePosition.imageOnly] if [label] is null;
  /// - [ImagePosition.left] if [imagePosition] is null;
  /// - otherwise the [imagePosition] value will be used.
  LabeledImage({
    this.image,
    this.label,
    ImagePosition imagePosition,
  }) : this.imagePosition = _determineImagePosition(
          defaultPosition: imagePosition,
          image: image,
          label: label,
        );

  /// Determine the value of [imagePosition] based on [label], [icon] and
  /// [defaultPosition].
  static ImagePosition _determineImagePosition({
    @required String label,
    @required TouchBarImage image,
    @required ImagePosition defaultPosition,
  }) {
    if (image == null) return ImagePosition.noImage;
    if (label == null) return ImagePosition.imageOnly;
    if (defaultPosition == null) return ImagePosition.left;

    return defaultPosition;
  }
}
