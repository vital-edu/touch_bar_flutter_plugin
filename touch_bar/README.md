# touch_bar

A Flutter plugin for interact with the touch bar of supported models of MacBook Pro, providing dynamic contextual controls.

## Why this is a federated plugin?

Although the TouchBar is a hardware that exists solely in some versions of the MacBook Pro, we cannot guarantee that this will always be the case.
 
Besides, in the nearish future, the browsers can add a public API to allow  web pages interaction with the TouchBar. Actually, there is [an issue that requests a TouchBar Web API in the WebKit][1].  

# Todo

Support touch bar items:

- [ ] LabelTouchBarItem
- [ ] ButtonTouchBarItem
- [ ] SliderTouchBarItem: provides a slider control for choosing a value in a range
- [ ] GroupTouchBarItem: a item that contains another items
- [ ] PopoverTouchBarItem: provides a two-state control that, when touched or pressed, expands into its second state, showing the contents of a bar it owns
- [ ] ColorPickerTouchBarItem: provide a system-defined color picker
- [ ] CandidateListTouchBarItem: provide a list of textual suggestions for the current text view

[1]: https://bugs.webkit.org/show_bug.cgi?id=178736 