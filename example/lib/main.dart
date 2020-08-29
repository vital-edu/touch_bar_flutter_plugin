import 'package:flutter/material.dart';
import 'package:touch_bar/touch_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

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
  ];
  TouchBarPopover popover = TouchBarPopover(
    label: 'Options',
    iconPosition: ImagePosition.left,
    children: [
      TouchBarLabel('Yello Label', textColor: Colors.yellow),
      TouchBarLabel('Pink Label', textColor: Colors.pink),
    ],
    showCloseButton: true,
  );
  int _counter = 0;
  TouchBar bar;
  TouchBarImage plusImage;
  TouchBarImage minusImage;
  TouchBarImage menuImage;
  TouchBarImage menu2Image;
  TouchBarLabel popoverLabel1 = TouchBarLabel('Popover 1');
  TouchBarLabel popoverLabel2 = TouchBarLabel('Popover 2');

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
    Function onClick;
    String label;
    String popoverLabel;
    Color color;
    ImagePosition position;
    bool popoverShowCloseButton;
    TouchBarImage operatorImage;
    TouchBarImage popoverImage;
    List<TouchBarItem> popoverChildren;

    if (_counter >= 10) {
      popoverShowCloseButton = false;
      onClick = _decrementCounter;
      label = 'Decrement 1';
      color = Colors.red;
      position = ImagePosition.left;
      popoverLabel = 'Menu 2';
      operatorImage = minusImage;
      popoverImage = menu2Image;
      popoverChildren = [timesTwoCounterLabel, popoverLabel1, actionButton];
    } else if (_counter <= 0) {
      popoverShowCloseButton = true;
      onClick = _incrementCounter;
      label = 'Increment 1';
      color = Colors.green;
      position = ImagePosition.right;
      popoverLabel = 'Menu 1';
      operatorImage = plusImage;
      popoverImage = menuImage;
      popoverChildren = [actionButton, popoverLabel2, timesTwoCounterLabel];
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
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
      counterLabel.label = 'Counter: $_counter';
      counterLabel.textColor = colors[_counter % colors.length];
      timesTwoCounterLabel.label = 'Counter: ${_counter * 2}';
      timesTwoCounterLabel.textColor = colors[(_counter + 1) % colors.length];
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
    });

    _invertOperatorIfNeeded();
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

    actionButton.icon = plusImage;
    actionButton.onClick = _incrementCounter;

    popover.icon = menuImage;

    bar = TouchBar(children: [
      actionButton,
      TouchBarLabel('Red Label', textColor: Colors.red),
      TouchBarLabel('Blue Label', textColor: Colors.blue),
      counterLabel,
      popover,
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
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
