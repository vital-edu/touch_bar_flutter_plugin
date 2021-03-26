import 'package:flutter/material.dart';
import 'package:touch_bar/touch_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MaterialColor themeColor = Colors.blue;

  void _changeThemeColor(MaterialColor color) {
    setState(() {
      themeColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: themeColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(
        title: 'Flutter Demo Home Page',
        changeThemeColor: _changeThemeColor,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  final Function changeThemeColor;
  MyHomePage({
    Key? key,
    required this.title,
    required this.changeThemeColor,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static List<Color> colors = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.pink,
    Colors.purple,
    Colors.grey,
    Colors.orange,
    Colors.brown,
    Colors.white,
    Colors.redAccent,
    Colors.lime,
  ];
  Color buttonColor = Colors.blue;
  TouchBarPopover popover = TouchBarPopover(
    label: 'Options',
    iconPosition: ImagePosition.left,
    children: [
      TouchBarLabel('Yellow', textColor: Colors.yellow),
      TouchBarSpace.small(),
      TouchBarLabel('Pink', textColor: Colors.pink),
      TouchBarSpace.large(),
      TouchBarLabel('Red', textColor: Colors.red),
      TouchBarSpace.flexible(),
      TouchBarLabel('Blue', textColor: Colors.blue),
    ],
    showCloseButton: true,
  );
  int _counter = 0;
  late TouchBar bar;
  TouchBarImage? plusImage;
  TouchBarImage? minusImage;
  TouchBarImage? menuImage;
  TouchBarImage? menu2Image;
  TouchBarLabel popoverLabel1 = TouchBarLabel('Popover 1');
  TouchBarLabel popoverLabel2 = TouchBarLabel('Popover 2');
  late TouchBarScrubber scrubber;
  List<TouchBarScrubberItem> scrubberChildren = [];
  bool isIncrementing = true;
  bool isHighlightingTheColor = false;
  Color highlghtColor = Colors.blue;

  TouchBarButton actionButton = TouchBarButton(
    label: "Increment 1",
    backgroundColor: Colors.green,
    iconPosition: ImagePosition.right,
  );

  TouchBarLabel counterLabel = new TouchBarLabel(
    'Counter: 0',
    textColor: Colors.red,
  );
  TouchBarLabel timesTwoCounterLabel = TouchBarLabel(
    'Counter: 2',
    textColor: Colors.blue,
  );

  void _invertOperatorIfNeeded() {
    Function()? onClick;
    String label;
    String popoverLabel;
    Color color;
    ImagePosition position;
    bool popoverShowCloseButton;
    TouchBarImage? operatorImage;
    TouchBarImage? popoverImage;
    List<TouchBarItem> popoverChildren;

    bool scrubberShowArrowButtons;
    bool scrubberIsContinuos;
    ScrubberMode scrubberMode;
    ScrubberSelectionStyle scrubberOverlayStyle;
    ScrubberSelectionStyle scrubberSelectedStyle;
    bool isIncrementing;

    if (_counter >= 10) {
      isIncrementing = false;
      popoverShowCloseButton = false;
      onClick = _decrementCounter;
      label = 'Decrement 1';
      color = Colors.red;
      position = ImagePosition.left;
      popoverLabel = 'Menu 2';
      operatorImage = minusImage;
      popoverImage = menu2Image;
      popoverChildren = [timesTwoCounterLabel, popoverLabel1, actionButton];

      scrubberShowArrowButtons = false;
      scrubberIsContinuos = false;
      scrubberMode = ScrubberMode.free;
      scrubberOverlayStyle = ScrubberSelectionStyle.none;
      scrubberSelectedStyle = ScrubberSelectionStyle.outlineOverlay;
    } else if (_counter <= 0) {
      isIncrementing = true;
      popoverShowCloseButton = true;
      onClick = _incrementCounter;
      label = 'Increment 1';
      color = Colors.green;
      position = ImagePosition.right;
      popoverLabel = 'Menu 1';
      operatorImage = plusImage;
      popoverImage = menuImage;
      popoverChildren = [actionButton, popoverLabel2, timesTwoCounterLabel];

      scrubberShowArrowButtons = true;
      scrubberIsContinuos = true;
      scrubberMode = ScrubberMode.fixed;
      scrubberOverlayStyle = ScrubberSelectionStyle.outlineOverlay;
      scrubberSelectedStyle = ScrubberSelectionStyle.roundedBackground;
    } else {
      return; // do not invert operator
    }

    setState(() {
      actionButton.onClick = onClick;
      actionButton.label = label;
      actionButton.backgroundColor = color;
      actionButton.iconPosition = position;
      actionButton.icon = operatorImage;

      popover.iconPosition = position;
      popover.label = popoverLabel;
      popover.showCloseButton = popoverShowCloseButton;
      popover.icon = popoverImage;
      popover.children = popoverChildren;

      scrubber.showArrowButtons = scrubberShowArrowButtons;
      scrubber.isContinuos = scrubberIsContinuos;
      scrubber.mode = scrubberMode;
      scrubber.overlayStyle = scrubberOverlayStyle;
      scrubber.selectedStyle = scrubberSelectedStyle;

      this.isIncrementing = isIncrementing;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
      counterLabel.label = 'Counter: $_counter';
      counterLabel.textColor = colors[_counter % colors.length];
      timesTwoCounterLabel.label = 'Counter: ${_counter * 2}';
      timesTwoCounterLabel.textColor = colors[(_counter + 1) % colors.length];

      scrubberChildren.add(TouchBarScrubberLabel(
        "Another Color",
        textColor: colors[_counter % colors.length],
      ));
      scrubber.children = scrubberChildren;
    });

    _invertOperatorIfNeeded();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      counterLabel.label = 'Counter: $_counter';
      counterLabel.textColor = colors[_counter % colors.length];
      timesTwoCounterLabel.label = 'Counter: ${_counter * 2}';
      timesTwoCounterLabel.textColor = colors[(_counter + 1) % colors.length];

      scrubberChildren.removeLast();
      scrubber.children = scrubberChildren;
    });

    _invertOperatorIfNeeded();
  }

  void _onClick() {
    if (isIncrementing) {
      _incrementCounter();
    } else {
      _decrementCounter();
    }
  }

  @override
  void initState() {
    super.initState();
    loadAssyncData();
  }

  void loadAssyncData() async {
    final plusImage = await TouchBarImage.loadFrom(
      path: 'assets/icons/plus.png',
    );
    final minusImage = await TouchBarImage.loadFrom(
      path: 'assets/icons/minus.png',
    );
    final menuImage = await TouchBarImage.loadFrom(
      path: 'assets/icons/menu.png',
    );
    final menu2Image = await TouchBarImage.loadFrom(
      path: 'assets/icons/menu-2.png',
    );
    scrubberChildren = [
      ...colors
          .asMap()
          .map((idx, color) => MapEntry(
              idx,
              TouchBarScrubberLabel(
                'Another Color $idx',
                textColor: color,
              )))
          .values
          .toList(),
      TouchBarScrubberImage(plusImage),
    ];
    scrubber = TouchBarScrubber(
        children: scrubberChildren,
        selectedStyle: ScrubberSelectionStyle.roundedBackground,
        overlayStyle: ScrubberSelectionStyle.outlineOverlay,
        mode: ScrubberMode.fixed,
        onSelect: (childId) {
          setState(() => isHighlightingTheColor = false);
          widget.changeThemeColor(
            colors[childId % colors.length],
          );
        },
        onHighlight: (childId) => this.setState(() {
              isHighlightingTheColor = true;
              highlghtColor = colors[childId % colors.length];
            }));

    actionButton.icon = plusImage;
    actionButton.onClick = _incrementCounter;

    popover.icon = menuImage;

    bar = TouchBar(children: [
      actionButton,
      TouchBarLabel('Red Label', textColor: Colors.red),
      TouchBarLabel('Blue Label', textColor: Colors.blue),
      counterLabel,
      popover,
      TouchBarPopover(
        label: 'Colors',
        children: [scrubber],
        showCloseButton: true,
      )
    ]);
    setTouchBar(bar);

    setState(() {
      this.bar = bar;
      this.plusImage = plusImage;
      this.minusImage = minusImage;
      this.menuImage = menuImage;
      this.menu2Image = menu2Image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (isHighlightingTheColor)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('You are highlightining the color '),
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: highlghtColor,
                      ),
                    ),
                  )
                ],
              ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onClick,
        tooltip: 'Increment/Decrement',
        child: Icon(Icons.add),
        backgroundColor: buttonColor,
      ),
    );
  }
}
