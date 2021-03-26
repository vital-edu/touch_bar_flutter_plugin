// Copyright (c) 2020 The TouchBar Flutter Plugin Authors
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import FlutterMacOS

class TouchBarPluginReaderWritter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    return TouchBarPluginReader(data: data)
  }
}
