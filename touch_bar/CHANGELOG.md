## 0.3.0-alpha.1
- Add option to load image from network using `TouchBarImage.loadFromNetwork`.

## 0.2.0-alpha.1
- Add unselectAfterHit option to Scrubber.

## 0.1.0-alpha.1
- Migrate to null safety.

## 0.0.1-alpha.3
- Add compatibility to macOS version above 10.11: the plugin does not have any use for MacOS below 10.12.2 (TouchBar is available since macOS 10.12.2) but now, the plugin can be used in projects targeting macOS 10.11 without raising any build errors.

## 0.0.1-alpha.2
- Implement MethodChannelTouchBar in TouchBarInterface and make it the default implementation of TouchBarPlatform
- Remove unnecessary dependency of TouchBarInterface from TouchBarMacOS
- Fix macos version in podspec

## 0.0.1-alpha.1
- Fix dependencies in pubspec.

## 0.0.1-alpha
- Initial open-source release.
