// Copyright (c) 2020 Eduardo Vital Alencar Cunha
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import FlutterMacOS

class TouchBarPluginReader: FlutterStandardReader {
  override func readValue(ofType type: UInt8) -> Any? {
    switch type {
      case TouchBarCodecValueType.Image.rawValue:
        let key: String = self.readValue() as! String

        let imageSize = UInt(self.readSize())
        let data: Data = self.readData(imageSize)

        return TouchBarImage(key: key, data: data)
      case TouchBarCodecValueType.Color.rawValue:
        let decimalRepresentation = self.readValue() as! NSNumber
        let hexRepresentation = String(decimalRepresentation.uint32Value, radix: 16)

        return NSColor.init(fromARGB: hexRepresentation)
      case TouchBarCodecValueType.Identifier.rawValue:
        return self.readValue() as! String
      default:
        return super.readValue(ofType: type)
    }
  }
}
