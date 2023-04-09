// Copyright (c) 2020 The TouchBar Flutter Plugin Authors
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

@available(OSX 10.12.2, *)
class TouchBarScrubber: NSCustomTouchBarItem, TouchBarItem, NSTouchBarDelegate {
  static let ScrubberTextItemIdentifier = NSUserInterfaceItemIdentifier("ScrubberTextItem")
  static let ScrubberImageItemIdentifier = NSUserInterfaceItemIdentifier("ScrubberImageItem")

  let scrubber: NSScrubber = NSScrubber(frame: NSRect.zero)
  var children = [TouchBarScrubberItem]()
  let touchBarFactory = TouchBarItemFactory()

  var onSelect: String?
  var onHighlight: String?
  var unselectAfterHit: Bool = false

  required init?(identifier: NSTouchBarItem.Identifier, withData itemData: NSDictionary) {
    super.init(identifier: identifier)

    self.scrubber.register(NSScrubberTextItemView.self, forItemIdentifier: Self.ScrubberTextItemIdentifier)
    self.scrubber.register(NSScrubberImageItemView.self, forItemIdentifier: Self.ScrubberImageItemIdentifier)
    self.scrubber.dataSource = self
    self.scrubber.delegate = self

    self.view = scrubber

    if let children = itemData["children"] as? [NSDictionary] {
      self.children = children.map{ (child) -> TouchBarScrubberItem in
        switch child["type"] as? String {
          case TouchBarScrubberItemType.image.rawValue:
            return TouchBarScrubberImage(withData: child)
          case TouchBarScrubberItemType.label.rawValue:
            fallthrough
          default:
            return TouchBarScrubberLabel(withData: child)
        }
      }
    }

    let showArrowButtons = itemData["showArrowButtons"] as? Bool ?? false
    let isContinuous = itemData["isContinuous"] as? Bool ?? true
    self.unselectAfterHit = itemData["unselectAfterHit"] as? Bool ?? false

    self.scrubber.showsArrowButtons = showArrowButtons
    self.scrubber.isContinuous = isContinuous

    if let onSelect = itemData["onSelect"] as? String {
      self.onSelect = onSelect
    }
    if let onHighlight = itemData["onHighlight"] as? String {
      self.onHighlight = onHighlight
    }
    if let style = itemData["selectedStyle"] as? String {
      let selectedStyle = ScrubberSelectionStyle(style)
      self.scrubber.selectionBackgroundStyle = selectedStyle.toSelectionStyle()
    }
    if let style = itemData["overlayStyle"] as? String {
      let overlayStyle = ScrubberSelectionStyle(style)
      self.scrubber.selectionOverlayStyle = overlayStyle.toSelectionStyle()
    }
    if let rawMode = itemData["mode"] as? String {
      let mode = ScrubberMode(rawMode)
      self.scrubber.mode = mode.toMode()
    }

    self.scrubber.showsArrowButtons = showArrowButtons
    self.scrubber.isContinuous = isContinuous
  }

  func update(data: NSDictionary) {
    if let style = data["selectedStyle"] as? String {
      let selectedStyle = ScrubberSelectionStyle(style)
      self.scrubber.selectionBackgroundStyle = selectedStyle.toSelectionStyle()
    } else if let style = data["overlayStyle"] as? String {
      let overlayStyle = ScrubberSelectionStyle(style)
      self.scrubber.selectionOverlayStyle = overlayStyle.toSelectionStyle()
    } else if let rawMode = data["mode"] as? String {
      let mode = ScrubberMode(rawMode)
      self.scrubber.mode = mode.toMode()
    } else if let showArrowButtons = data["showArrowButtons"] as? Bool{
      self.scrubber.showsArrowButtons = showArrowButtons
    } else if let isContinuous = data["isContinuous"] as? Bool {
      self.scrubber.isContinuous = isContinuous
    } else if let unselectAfterHit = data["unselectAfterHit"] as? Bool {
      self.unselectAfterHit = unselectAfterHit
    } else if let children = data["children"] as? [NSDictionary] {
      self.children = children.map{ (child) -> TouchBarScrubberItem in
        switch child["type"] as? String {
          case TouchBarScrubberItemType.image.rawValue:
            return TouchBarScrubberImage(withData: child)
          case TouchBarScrubberItemType.label.rawValue:
            fallthrough
          default:
            return TouchBarScrubberLabel(withData: child)
        }
      }

      self.scrubber.reloadData()
      self.scrubber.scrubberLayout.invalidateLayout()
    }
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

@available(OSX 10.12.2, *)
extension TouchBarScrubber: NSScrubberDataSource, NSScrubberDelegate {
  func numberOfItems(for scrubber: NSScrubber) -> Int {
    return self.children.count
  }

  func scrubber(_ scrubber: NSScrubber, viewForItemAt index: Int) -> NSScrubberItemView {
    let child = self.children[index]
    if let child = child as? TouchBarScrubberImage {
      let item = scrubber.makeItem(withIdentifier: Self.ScrubberImageItemIdentifier, owner: self) as! NSScrubberImageItemView
      item.image = child.image
      return item
    } else if let child = child as? TouchBarScrubberLabel {
      let item = scrubber.makeItem(withIdentifier: Self.ScrubberTextItemIdentifier, owner: self) as! NSScrubberTextItemView
      item.title = child.label
      item.textField.setAccessibilityLabel(child.accessibilityLabel)
      item.textField.textColor = child.textColor
      return item
    }

    return NSScrubberItemView()
  }

  func scrubber(_ scrubber: NSScrubber, didSelectItemAt selectedIndex: Int) {
    if let onSelect = self.onSelect {
      TouchBarPlugin.channel.invokeMethod(onSelect, arguments: selectedIndex)
    }
  }

  func scrubber(_ scrubber: NSScrubber, didHighlightItemAt highlightedIndex: Int) {
    if let onHighlight = self.onHighlight {
      TouchBarPlugin.channel.invokeMethod(onHighlight, arguments: highlightedIndex)
    }
  }

  func didFinishInteracting(with scrubber: NSScrubber) {
    if self.unselectAfterHit {
      // unselect the item here guarantee that the item will be unselected when the user only hit the item
      // and also when they drag the finger until the final selected item.
      // Because the dragging action runs with animation we need to set the selected item using the
      // animator: if not, the style of the item would not reflect the unselected state.
      scrubber.animator().selectedIndex = -1
    }
  }
}

@available(OSX 10.12.2, *)
extension TouchBarScrubber: NSScrubberFlowLayoutDelegate {
  func scrubber(_ scrubber: NSScrubber, layout: NSScrubberFlowLayout, sizeForItemAt itemIndex: Int) -> NSSize {
    let margin: CGFloat = 14
    var height: CGFloat = 30
    var width: CGFloat = 45

    let child = self.children[itemIndex]

    if let child = child as? TouchBarScrubberImage {
      width = child.image.size.width
      height = child.image.size.height
    } else if let child = child as? TouchBarScrubberLabel {
      let rect = (child.label as NSString).size(withAttributes: [.font: NSFont.systemFont(ofSize: 0)])
      width = rect.width + margin
    }

    return NSSize(width: width, height: height)
  }
}
