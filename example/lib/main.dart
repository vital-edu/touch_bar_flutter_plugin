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
  int _counter = 0;
  TouchBar bar;
  TouchBarImage icon;

  _incrementCounter() {
    setState(() {
      _counter++;
      bar = TouchBar(children: [
        TouchBarButton(
          label: "Increment +1",
          backgroundColor: Colors.yellow,
          onClick: _incrementCounter,
          icon: icon,
        ),
        TouchBarLabel('Red Label', textColor: Colors.red),
        TouchBarLabel('Blue Label', textColor: Colors.blue),
        TouchBarLabel('Counter: $_counter', textColor: Colors.white),
        TouchBarPopover(
          label: 'Options',
          icon: icon,
          iconPosition: ImagePosition.right,
          children: [
            TouchBarLabel('Yello Label', textColor: Colors.yellow),
            TouchBarLabel('Pink Label', textColor: Colors.pink),
            TouchBarButton(
              label: "Increment +1",
              backgroundColor: Colors.yellow,
              onClick: _incrementCounter,
              icon: icon,
            ),
          ],
          showCloseButton: true,
        ),
      ]);
      setTouchBar(bar);
    });
  }

  @override
  void initState() {
    super.initState();
    loadAssetImage();
  }

  void loadAssetImage() async {
    final image = await TouchBarImage.loadFrom(
      path: 'assets/icons/plus.png',
      key: 'plus',
    );

    setState(() {
      this.icon = image;
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
