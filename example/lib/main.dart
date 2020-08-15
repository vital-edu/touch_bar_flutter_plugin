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
  int _counter = 0;
  TouchBar bar;
  TouchBarLabel counterLabel = new TouchBarLabel(
    'Counter: 0',
    textColor: Colors.red,
  );
  TouchBarLabel timesTwoCounterLabel = TouchBarLabel(
    'Counter: 2',
    textColor: Colors.blue,
  );

  _incrementCounter() {
    setState(() {
      _counter++;
      counterLabel.label = 'Counter: $_counter';
      counterLabel.textColor = colors[_counter % colors.length];
      timesTwoCounterLabel.label = 'Counter: ${_counter * 2}';
      timesTwoCounterLabel.textColor = colors[(_counter + 1) % colors.length];
    });
  }

  @override
  void initState() {
    super.initState();
    loadAssyncData();
  }

  void loadAssyncData() async {
    final image = await TouchBarImage.loadFrom(
      path: 'assets/icons/plus.png',
      key: 'plus',
    );

    bar = TouchBar(children: [
      TouchBarButton(
        label: "Increment +1",
        backgroundColor: Colors.green,
        onClick: _incrementCounter,
        icon: image,
        iconPosition: ImagePosition.left,
      ),
      TouchBarLabel('Red Label', textColor: Colors.red),
      TouchBarLabel('Blue Label', textColor: Colors.blue),
      counterLabel,
      TouchBarPopover(
        label: 'Options',
        icon: image,
        iconPosition: ImagePosition.left,
        children: [
          TouchBarLabel('Yello Label', textColor: Colors.yellow),
          TouchBarLabel('Pink Label', textColor: Colors.pink),
          timesTwoCounterLabel,
          TouchBarButton(
            label: "Increment +1",
            backgroundColor: Colors.yellow,
            onClick: _incrementCounter,
            icon: image,
            iconPosition: ImagePosition.right,
          ),
        ],
        showCloseButton: true,
      ),
    ]);
    setTouchBar(bar);

    setState(() {
      this.bar = bar;
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
