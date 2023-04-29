# TouchBar Flutter Plugin

This repo contains the code to the TouchBar plugin.

This plugin has the goal of provide full support to the MacBook Touch Bar in Flutter applications.

For more information about plugins, and how to use them, see https://flutter.dev/platform-plugins/.

## Setup

### Loading images from network

By default, MacOS applications cannot connect to the internet. Thus if you want to load network images, you have to add the `Network Outgoing Connection (Client)` entitlement to your application using XCode or edit the entitlement files with your preferred editor.

#### Using XCode

1. Open the file `macos/Runner.xcworkspace` with XCode
1. Select the `Runner` project in the `Project` navigator (left sidebar).
1. Select the `Runner` target in the `Targets` list.
1. Click the `Signing & Capabilities` tab in the project editor.
1. Locate the `App Sandbox` capability.
1. Check the `Outgoing Connections (Client)` checkbox to enable outgoing network connections for your app.

#### Editing entitlements files

1. Add the lines below to all the files matching the pattern `macos/Runner/*.entitlements`. Example:
   * `macos/Runner/DebugProfile.entitlements`
   * `macos/Runner/Release.entitlements`


```plist
<key>com.apple.security.network.client</key>
<true/>
```
### Additional resources

If you want to know more about entitlements, check it out the following documentation:
- [Flutter Docs: Entitlements and the app sandbox](https://docs.flutter.dev/platform-integration/macos/building#entitlements-and-the-app-sandbox)
- [Apple Developer Documentation: Entitlements](https://developer.apple.com/documentation/bundleresources/entitlements)
- [Apple Developer Documentation: App Sandbox](https://developer.apple.com/documentation/security/app_sandbox)

## Contributing

If you wish to contribute a change to any of the existing plugins in this repo, please review
our [contribution guide](https://github.com/vital-edu/touch_bar_flutter_plugin/blob/master/CONTRIBUTING.md)
and open a [pull request](https://github.com/vital-edu/touch_bar_flutter_plugin/pulls).
