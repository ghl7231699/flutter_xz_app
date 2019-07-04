import 'package:flutter/material.dart';
import 'package:flutter_app/ui/widget/hero_animation.dart';

import 'home.dart';
import 'listview.dart';

class FirstApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "欢迎来到flutter的世界",
      theme: new ThemeData(primaryColor: Colors.blue),
      home: new RandomWord(),
//      home: new Image.network(
//          "https://image.xiaozhustatic1.com/00,420,540/51,0,24,111678,420,540,760d27ff.jpg",
//          fit: BoxFit.fill),
    );
  }
}

///StatefulWidget类本身是不变的，但是 State类在widget生命周期中始终存在.
class RandomWord extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new RandomWordState();
}

///
class RandomWordState extends State<RandomWord>
    with SingleTickerProviderStateMixin {
  final _titles = <String>[
    "Container",
    "GridView",
    "Stack",
    "ListView",
    "Hero"
  ];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Center(
        child: new Text("欢迎来到Flutter的世界"),
      )),
      body: _buildSuggestion(),
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget _buildSuggestion() {
    return new Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        _buildRow(_titles[0]),
        _buildRow(_titles[1]),
        _buildRow(_titles[2]),
        _buildRow(_titles[3]),
        _buildRow(_titles[4]),
      ],
    );
  }

  Widget _buildRow(String suggestion) {
    return new GestureDetector(
      onTap: () {
        handleTap(suggestion);
      },
      child: new Center(
        child: new Container(
          padding: EdgeInsets.all(32.0),
          child: new Text(
            suggestion,
            style: _biggerFont,
          ),
        ),
      ),
    );
  }

  void handleTap(String tag) {
    _pushSaved(get(tag));
  }

  WidgetBuilder get(String tag) {
    if ("Container" == tag) {
      return (context) => new Home();
    } else if ("GridView" == tag) {
      return (context) => new ListViewApp();
    } else if ("Stack" == tag) {
      return (context) => new ListViewApp();
    } else if ("ListView" == tag) {
      return (context) => new ListViewApp();
    } else if ("Hero" == tag) {
      return (context) => new HeroAnimationWidget();
    } else {
      return null;
    }
  }

  void _pushSaved(WidgetBuilder builder) {
    Navigator.of(context).push(
      new MaterialPageRoute(builder: builder),
    );
  }
}
