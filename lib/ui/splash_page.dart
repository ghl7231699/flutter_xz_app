import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/login/authentication_bloc.dart';
import 'package:flutter_app/login/authentication_events.dart';
import 'package:flutter_app/login/authentication_state.dart';
import 'package:flutter_app/login/user_repository.dart';
import 'package:flutter_app/navigationbar/navigationbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//class SplashPage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
////      body: Stack(
////        fit: StackFit.expand,
////        alignment: Alignment.bottomRight,
////        //全屏图片
////        children: <Widget>[
////          Image.asset(
////            'assets/images/main_login_bg.jpg',
////            fit: BoxFit.cover,
////          ),
////          ClickWidget(),
////        ],
////      ),
//
//      body: BlocBuilder<AuthenticationEvent, AuthenticationState>(
//        bloc: BlocProvider.of<AuthenticationBloc>(context),
//        builder: (BuildContext context, AuthenticationState state) {
//          if (state is AuthenticationAuthenticated) {
//            //如果验证通过
//          }
//          //默认返回登录界面
//          return Stack(
//            fit: StackFit.expand,
//            alignment: Alignment.bottomRight,
//            //全屏图片
//            children: <Widget>[
//              Image.asset(
//                'assets/images/main_login_bg.jpg',
//                fit: BoxFit.cover,
//              ),
////              ClickWidget(),
//            ],
//          );
//        },
//      ),
//    );
//  }
//}

class SplashPage extends StatefulWidget {
  final UserRepository userRepository;

  SplashPage({Key key, @required this.userRepository}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  static int count = 5;
  final List<AuthenticationState> states = [];

  Timer _timer;
  static Duration duration = Duration(seconds: 1);

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
        onClick(false);
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
    return Scaffold(
      body: BlocBuilder<AuthenticationEvent, AuthenticationState>(
        bloc: BlocProvider.of<AuthenticationBloc>(context),
        builder: (BuildContext context, AuthenticationState state) {
          if (state is AuthenticationAuthenticated) {
            //如果验证通过
            states.add(state);
          }
          return Stack(
            fit: StackFit.expand,
            alignment: Alignment.bottomRight,
            //全屏图片
            children: <Widget>[
              Image.asset(
                'assets/images/main_login_bg.jpg',
                fit: BoxFit.cover,
              ),
              buildItem(),
            ],
          );
        },
      ),
    );
  }

  Widget buildItem() {
    return new Container(
      margin: EdgeInsets.all(20.0),
      alignment: Alignment.bottomRight,
      child: new InkWell(
        onTap: () {
          onClick(true);
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

  void onClick(bool skip) {
//    BlocProvider<AuthenticationBloc>(builder: (context) {
//      return AuthenticationBloc(userRepository: userRepository)
//        ..dispatch(LoginFailed());
//    });
    //销毁上个页面
//    Navigator.pushAndRemoveUntil(
//        context,
////        new MaterialPageRoute(builder: (context) => new NavigationBarWidget()),
//        new MaterialPageRoute(
//            builder: (context) => LoginPage(
//                  userRepository: userRepository,
//                )),
//        (router) => router == null);

    if (skip == true &&
        (states != null && states.contains(AuthenticationAuthenticated))) {
      //登录成功  直接跳过
      BlocProvider<AuthenticationBloc>(builder: (context) {
        return AuthenticationBloc(userRepository: widget.userRepository)
          ..dispatch(LoginSucceed());
      });
    } else if (count <= 0 &&
        skip == false &&
        states.contains(AuthenticationAuthenticated)) {
      //倒计时结束 正常跳转
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => NavigationBarWidget()),
          (router) => router == null);
    } else {
      BlocProvider<AuthenticationBloc>(builder: (context) {
        return AuthenticationBloc(userRepository: widget.userRepository)
          ..dispatch(LoginFailed());
      });
    }
  }
}
