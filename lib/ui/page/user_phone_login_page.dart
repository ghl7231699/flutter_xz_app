import 'package:flutter/material.dart';
import 'package:flutter_app/res/colors.dart';
import 'package:flutter_app/res/styles.dart';
import 'package:flutter_app/router/fluro_navigator.dart';
import 'package:flutter_app/router/login_router.dart';
import 'package:flutter_app/ui/widget/app_bar.dart';
import 'package:flutter_app/ui/widget/mybutton.dart';
import 'package:flutter_app/ui/widget/text_field.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

///手机登录界面
///

class UserPhoneLoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => UserPhoneLoginState();
}

class UserPhoneLoginState extends State<UserPhoneLoginPage> {
  //定义一个controller
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  bool _click = false;

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
      keyboardBarColor: Colors.grey[200],
      nextFocus: true,
      actions: [
        KeyboardAction(
          focusNode: _focusNode1,
          closeWidget: Padding(
            padding: EdgeInsets.all(5.0),
            child: Text("关闭"),
          ),
        ),
        KeyboardAction(
          focusNode: _focusNode2,
          closeWidget: Padding(
            padding: EdgeInsets.all(5.0),
            child: Text("关闭"),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: Colors.white,
//        title: Container(
//          alignment: Alignment.centerRight,
//          child: Text(
//            '验证码登录',
//            style: TextStyle(
//              fontSize: 14.0,
//            ),
//          ),
//        ),
//      ),
      appBar: MyAppBar(
        isBack: false,
        actionName: '验证码登录',
        onPressed: () {
          NavigatorUtils.push(context, LoginRouter.authCodePage);
        },
      ),
//      body: defaultTargetPlatform == TargetPlatform.iOS
//          ? FormKeyboardActions(
//              child: _buildBody(),
//            )
//          : SingleChildScrollView(
//              child: _buildBody(),
//            ),
      body: _buildBody(),
    );
  }

  @override
  void initState() {
    _nameController.addListener(_verify);
    _passwordController.addListener(_verify);
    super.initState();
  }

  void _verify() {
    String name = _nameController.text;
    String password = _passwordController.text;
    if (name.isEmpty || name.length < 6) {
      setState(() {
        _click = false;
      });
      return;
    }
    if (password.isEmpty || password.length < 8) {
      setState(() {
        _click = false;
      });
      return;
    }
    setState(() {
      _click = true;
    });
  }

  void _login() {
    NavigatorUtils.push(context, LoginRouter.homePage);
  }

  _buildBody() {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "密码登录",
            style: TextStyles.textBoldDark26,
          ),
          Gaps.vGap16,
          MyTextField(
            focusNode: _focusNode1,
            controller: _nameController,
            maxLength: 11,
            keyboardType: TextInputType.phone,
            hintText: "请输入手机号",
          ),
          Gaps.vGap10,
          MyTextField(
            focusNode: _focusNode2,
            config: _buildConfig(context),
            isInputPwd: true,
            controller: _passwordController,
            maxLength: 16,
            hintText: "请输入密码",
          ),
          Gaps.vGap10,
          Gaps.vGap15,
          MyButton(
            onPressed: _click ? _login : null,
            text: "登录",
          ),
          Container(
            height: 40.0,
            alignment: Alignment.centerRight,
            child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              child: Text(
                '忘记密码',
                style: TextStyles.textGray12,
              ),
              onTap: () {
//                NavigatorUtils.push(context, LoginRouter.resetPasswordPage);
              },
            ),
          ),
          Gaps.vGap16,
          Container(
              alignment: Alignment.center,
              child: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: Text(
                  '还没账号？快去注册',
                  style: TextStyle(color: Colours.text_blue),
                ),
                onTap: () {
//                  NavigatorUtils.push(context, LoginRouter.registerPage);
                },
              ))
        ],
      ),
    );
  }
}
