// Copyright (c) 2020 Eduardo Vital Alencar Cunha
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import FlutterMacOS

class TouchBarPluginReader: FlutterStandardReader {
  override func readValue(ofType type: UInt8) -> Any? {
    switch type {
      case TouchBarCodecValueTupe.Image.rawValue:
        let key: String = self.readValue() as! String

        let imageSize = UInt(self.readSize())
        let data: Data = self.readData(imageSize)

        return TouchBarImage(key: key, data: data)
      default:
        return super.readValue(ofType: type)
    }
  }
}
