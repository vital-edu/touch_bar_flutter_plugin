// Copyright (c) 2020 Eduardo Vital Alencar Cunha
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

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
  String? label;
  TouchBarImage? image;
  ImagePosition? imagePosition;

  /// Creates an instance of a [LabeledImage] with the given [image], [label]
  /// and [imagePosition].
  LabeledImage({
    this.image,
    this.label,
    this.imagePosition,
  });
}
