import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;
import 'package:flutter_app/animator/photohero.dart';
import 'package:flutter_app/router/fluro_navigator.dart';
import 'package:flutter_app/router/login_router.dart';

void main() {
  debugPaintSizeEnabled = true;
  runApp(new UserLoginMainPage());
}

class UserLoginMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "登录",
      home: new Scaffold(
        body: UserLoginWidget(),
      ),
    );
  }
}

class UserLoginWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => UserLoginMainState();
}

class UserLoginMainState extends State<UserLoginWidget> {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Image.asset(
                      'images/main_login_bg.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        PhotoHeroWidget(
            photo: 'images/main_login_bg.jpg',
            height: double.infinity,
            width: double.infinity,
            onTap: () {}),
        Positioned(
            left: 30,
            bottom: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //微信登录
                buildContentImage(
                    "使用微信一键登录", Colors.green, Icons.assignment_ind, true),
                //手机登录
                buildContentImage(
                    '手机方式登录', Color(0xFFFF5F7A), Icons.person, false)
              ],
            ))
      ],
    );
  }

  Widget buildContentImage(
      String content, Color contentColors, IconData iconLeft, bool show) {
    return new InkWell(
      onTap: () {
        show ? onWXTap() : onPhoneTap();
      },
      child: new Container(
        padding: EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 10),
        margin: EdgeInsets.only(top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Container(
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Icon(
                    iconLeft,
                    color: contentColors,
                  ),
                  new Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      content,
                      style: TextStyle(
                          color: contentColors,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  show
                      ? new Container(
                          margin: EdgeInsets.only(left: 100),
                          width: 25.0,
                          height: 25,
                          child: new Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                          ),
                        )
                      : new Container(),
                ],
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
      ),
    );
  }

  //微信登录
  void onWXTap() {
    NavigatorUtils.push(context, LoginRouter.homePage, replace: true);
  }

  //手机登录
  void onPhoneTap() {
    NavigatorUtils.push(context, LoginRouter.loginMainPage, replace: true);
  }
}
