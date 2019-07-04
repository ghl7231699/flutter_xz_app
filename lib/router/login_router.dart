import 'package:fluro/fluro.dart';
import 'package:flutter_app/navigationbar/navigationbar.dart';
import 'package:flutter_app/router/router_init.dart';
import 'package:flutter_app/ui/page/auth_code_page.dart';
import 'package:flutter_app/ui/page/user_phone_login_page.dart';

///登录模块路由
class LoginRouter implements IRouterProvider {
  static String authCodePage = "/auth_page";
  static String homePage = "/home";
  static String loginMainPage = "/login_main";

  @override
  void initRouter(Router router) {
    router.define(homePage,
        handler: Handler(handlerFunc: (_, params) => NavigationBarWidget()));
    router.define(authCodePage,
        handler: Handler(handlerFunc: (_, params) => AuthCodePage()));
    router.define(loginMainPage,
        handler: Handler(handlerFunc: (_, params) => UserPhoneLoginPage()));
  }
}
