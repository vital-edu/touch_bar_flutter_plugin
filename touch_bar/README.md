# touch_bar

A Flutter plugin for interact with the touch bar of supported models of MacBook Pro, providing dynamic contextual controls.

![image](https://user-images.githubusercontent.com/24459435/111548272-beb19100-877a-11eb-88dc-f54b0b046bd3.png)

## Why this is a federated plugin?

Although the TouchBar is a hardware that exists solely in some versions of the MacBook Pro, we cannot guarantee that this will always be the case.

Besides, in the nearish future, the browsers can add a public API to allow  web pages interaction with the TouchBar. Actually, there is [an issue that requests a TouchBar Web API in the WebKit][1].

# Todo

## Planned Releases

### Alpha version

- [X] TouchBarLabel
- [x] TouchBarButton
- [X] TouchBarPopover
- [X] TouchBarScrubber
- [X] TouchBarSpace: a blank space.

### Beta version

**Estimated release on Q4 2020**

- [ ] TouchBarSlider
- [ ] TouchBarGroup
- [ ] TouchBarSegmentedControl
- [ ] TouchBarColorPicker

### Stable version

**Estimated release on Q1 2021**

- [ ] Widget support

[1]: https://bugs.webkit.org/show_bug.cgi?id=178736
