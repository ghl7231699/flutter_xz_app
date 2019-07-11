import 'package:flutter/material.dart';
import 'package:flutter_app/dialog/loading_dialog.dart';
import 'package:flutter_app/login/authentication_events.dart';
import 'package:flutter_app/login/login_bloc.dart';
import 'package:flutter_app/login/login_events.dart';
import 'package:flutter_app/login/login_state.dart';
import 'package:flutter_app/res/colors.dart';
import 'package:flutter_app/res/styles.dart';
import 'package:flutter_app/router/fluro_navigator.dart';
import 'package:flutter_app/router/login_router.dart';
import 'package:flutter_app/ui/widget/app_bar.dart';
import 'package:flutter_app/ui/widget/mybutton.dart';
import 'package:flutter_app/ui/widget/text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

///手机登录界面
///

class UserPhoneLoginPage extends StatefulWidget {
//  final UserRepository userRepository;
//
//  UserPhoneLoginPage({Key key, @required this.userRepository})
//      : assert(userRepository != null),
//        super(key: key);

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
    final LoginBloc _loginBloc = BlocProvider.of<LoginBloc>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        isBack: false,
        actionName: '验证码登录',
        onPressed: () {
          NavigatorUtils.push(context, LoginRouter.authCodePage);
        },
      ),
//      body: BlocProvider(
//        builder: (context) {
//          return LoginBloc(
//            bloc: BlocProvider.of<AuthenticationBloc>(context),
//            userRepository: widget.userRepository,
//          );
//        },
//        child: _buildBody(_loginBloc),
//      ),
      body: _buildBody(_loginBloc),
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
    if (name.isEmpty || name.length < 2) {
      setState(() {
        _click = false;
      });
      return;
    }
    if (password.isEmpty || password.length < 4) {
      setState(() {
        _click = false;
      });
      return;
    }
    setState(() {
      _click = true;
    });
  }

  void _login(BuildContext context, LoginBloc _loginBloc) {
    showDialog(
        context: context,
        builder: (context) {
          return LoadingDialog();
        });

    _loginBloc.dispatch(LoginButtonPressed(
        userName: _nameController.text, password: _passwordController.text));
  }

  Widget _buildBody(LoginBloc _loginBloc) {
    return BlocListener<LoginEvent, LoginState>(
      bloc: _loginBloc,
      listener: (context, state) {
        if (state is LoginIn) {
          NavigatorUtils.push(context, LoginRouter.homePage);
        }
      },
      child: BlocBuilder(
          bloc: _loginBloc,
          builder: (BuildContext context, LoginState state) {
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
                    onPressed: _click
                        ? () {
                            _login(context, _loginBloc);
                          }
                        : null,
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
          }),
    );
  }
}
