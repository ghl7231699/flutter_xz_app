import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;
import 'package:flutter_app/router/fluro_navigator.dart';
import 'package:flutter_app/router/login_router.dart';
import 'package:flutter_app/utils/image_utils.dart';

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
        Image.asset(
          'assets/images/main_login_bg.jpg',
          fit: BoxFit.cover,
        ),
//        PhotoHeroWidget(
//            photo: 'assets/images/main_login_bg.jpg',
//            height: double.infinity,
//            width: double.infinity,
//            onTap: () {}),
        Positioned(
            left: 30,
            bottom: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //微信登录
                buildContentImage(
                    "使用微信一键登录", Colors.green, Icons.assignment_ind, true,
                    iconPath: 'icon_login_weixin'),
                //手机登录
                buildContentImage(
                    '手机方式登录', Color(0xFFFF5F7A), Icons.person, false)
              ],
            ))
      ],
    );
  }

  Widget buildContentImage(
      String content, Color contentColors, IconData iconLeft, bool show,
      {String iconPath}) {
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
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: iconPath == null || iconPath.isEmpty
                        ? Icon(
                            iconLeft,
                            color: contentColors,
                          )
                        : loadAssetImage(iconPath,
                            width: 20, height: 20, color: contentColors),
                  ),
                  Container(
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
                          child: Icon(
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
            ),
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
