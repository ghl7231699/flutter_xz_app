import 'package:flutter/material.dart';
import 'package:flutter_app/animator/photohero.dart';
import 'package:flutter_app/navigationbar/navigationbar.dart';
import 'package:flutter_app/ui/widget/hero_animation.dart';

class UserLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "手机登录",
      home: new Scaffold(
        body: UserLoginWidget(),
      ),
    );
  }
}

class UserLoginWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => UserLoginState();
}

class UserLoginState extends State<UserLoginWidget> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Column(
        children: <Widget>[
          PhotoHeroWidget(
            photo: 'images/main_login_bg.jpg',
            height: 300.0,
            width: double.infinity,
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 30),
            //微信登录
            child: buildEditItem("您的手机号", Color(0xFFFF5F7A), "输入您的手机号",
                Colors.green, Icons.assignment_ind, false),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.only(left: 20, right: 20),
            child: buildEditItem("短信验证码", Color(0xFFFF5F7A), "", Colors.green,
                Icons.assignment_ind, true),
          )
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(100))),
    );
  }

  Widget buildEditItem(String title, Color titleColor, String content,
      Color contentColors, IconData iconLeft, bool show) {
    return Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row(
              children: <Widget>[
                new Container(
                  child: new Text(
                    title,
                    style: TextStyle(
                        fontSize: 12,
                        color: titleColor,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            new Container(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(hintText: content),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  show
                      ? Container(
                          child: new Text(
                            "获取验证码",
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        )
                      : Container()
                ],
              ),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 0.5, color: Colors.grey))),
            ),
          ],
        ));
  }

  //微信登录
  void onWXTap() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HeroAnimationWidget()));
  }

  //手机登录
  void onPhoneTap() {
    Navigator.pushAndRemoveUntil(
        context,
        new MaterialPageRoute(builder: (context) => new NavigationBarWidget()),
        (router) => router == null);
  }
}
