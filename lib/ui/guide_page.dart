import 'dart:async';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/router/application.dart';
import 'package:flutter_app/router/routers.dart';
import 'package:flutter_app/ui/page/user_login_main_page.dart';

///引导页
///TODO  添加引导页+开屏广告
void main() => runApp(new GuidePageWidget());

class GuidePageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //取消状态栏 虚拟按键
//    SystemChrome.setEnabledSystemUIOverlays([]);
    //开启状态栏虚拟按键
//    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top, SystemUiOverlay.bottom]);
    return new MaterialApp(
      home: new Scaffold(
        body: new Stack(
          fit: StackFit.expand,
          alignment: Alignment.bottomRight,
          //全屏图片
          children: <Widget>[
            new Image.asset(
              'images/main_login_bg.jpg',
              fit: BoxFit.cover,
            ),
//            Positioned(
//                bottom: 30,
//                right: 20,
//                child: new Center(
//                  child: new Text(
//                    '我是测试',
//                    style: TextStyle(fontSize: 18.0, color: Colors.blue),
//                  ),
//                )),
            new ClickWidget(),
          ],
        ),
      ),
    );

//    return new MaterialApp(
//      routes: {
//        '/MainPage': (ctx) => MainPage(),
//      },
//      home: new SplashPage(),
//    );
  }

  GuidePageWidget() {
    final router = Router();
    Routers.configureRouters(router);
    Application.router = router;
  }
}

class ClickWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new ClickState();
}

class ClickState extends State<ClickWidget> {
  static int count = 5;
  Timer _timer;
  static Duration duration = new Duration(seconds: 1);

  void startTime() {
    _timer = Timer.periodic(duration, (timer) {
      count--;
      //到时回调
      print(
          'afterTimer=' + DateTime.now().toString() + "\t" + count.toString());
      setState(() {});
      if (count <= 0) {
        //取消定时器，避免无限回调
        timer.cancel();
        timer = null;
        onClick();
      }
    });
  }

  @override
  void initState() {
    startTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //进入app
    return new Container(
      margin: EdgeInsets.all(20.0),
      alignment: Alignment.bottomRight,
      child: new InkWell(
        onTap: onClick,
        child: new Container(
          padding:
              EdgeInsets.only(left: 10.0, right: 10.0, top: 6.0, bottom: 6.0),
          child: new Text(
            '跳过$count s',
            style: new TextStyle(fontSize: 14.0, color: Colors.white),
          ),
          decoration: new BoxDecoration(
              color: Color(0x66000000),
              borderRadius: new BorderRadius.all(Radius.circular(5.0)),
              border: new Border.all(width: 0.1, color: Colors.grey)),
        ),
      ),

//      child: new GestureDetector(
//        child: const Text(
//          '进入App',
//          style: TextStyle(
//              color: Colors.white,
//              fontSize: 14.0,
//              fontWeight: FontWeight.normal),
//        ),
//        onTap: () {
//          onClick(context);
//        },
//      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

  void onClick() {
    //销毁上个页面
    Navigator.pushAndRemoveUntil(
        context,
//        new MaterialPageRoute(builder: (context) => new NavigationBarWidget()),
        new MaterialPageRoute(builder: (context) => UserLoginMainPage()),
        (router) => router == null);
//    //不销毁上个页面
//    Navigator.of(context).push(
//        new MaterialPageRoute(builder: (context) => new NavigationBarWidget()));
  }
}
