# TouchBar Flutter Plugin

This repo contains the code to the TouchBar plugin.

This plugin has the goal of provide full support to the MacBook Touch Bar in Flutter applications.

For more information about plugins, and how to use them, see https://flutter.dev/platform-plugins/.

# Setup

To load images from network, you need to add permissions to your Info.plist:

```plist
<key>NSAppTransportSecurity</key>
<dict>
  <key>NSAllowsLocalNetworking</key>
  <true/>
  <key>NSAllowsArbitraryLoads</key>
  <true/>
</dict>
```
## Contributing

This is my first ever Flutter plugin, so if you have any desire to contribute to this project, please reach me or file an issue.
