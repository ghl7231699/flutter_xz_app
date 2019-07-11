import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/login/authentication_bloc.dart';
import 'package:flutter_app/login/authentication_events.dart';
import 'package:flutter_app/login/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  final UserRepository userRepository;

  SplashPage({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.bottomRight,
        //全屏图片
        children: <Widget>[
          Image.asset(
            'assets/images/main_login_bg.jpg',
            fit: BoxFit.cover,
          ),
          ClickWidget(),
        ],
      ),
    );
  }
}

class ClickWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new ClickState();
}

class ClickState extends State<ClickWidget> {
  UserRepository userRepository;
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
        onClick(userRepository);
      }
    });
  }

  @override
  void initState() {
    startTime();
    userRepository = UserRepository();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //进入app
    return new Container(
      margin: EdgeInsets.all(20.0),
      alignment: Alignment.bottomRight,
      child: new InkWell(
        onTap: () {
          onClick(userRepository);
        },
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
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

  void onClick(UserRepository userRepository) {
    BlocProvider<AuthenticationBloc>(builder: (context) {
      return AuthenticationBloc(userRepository: userRepository)
        ..dispatch(LoginFailed());
    });
    //销毁上个页面
//    Navigator.pushAndRemoveUntil(
//        context,
////        new MaterialPageRoute(builder: (context) => new NavigationBarWidget()),
//        new MaterialPageRoute(
//            builder: (context) => LoginPage(
//                  userRepository: userRepository,
//                )),
//        (router) => router == null);

//    //不销毁上个页面
//    Navigator.of(context).push(
//        new MaterialPageRoute(builder: (context) => new NavigationBarWidget()));
//  }
//  }
  }
}
