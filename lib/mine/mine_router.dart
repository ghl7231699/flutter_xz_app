import 'package:fluro/fluro.dart';
import 'package:flutter_app/router/router_init.dart';

import 'mine_page.dart';

///登录模块路由
class LoginRouter implements IRouterProvider {
  static String personPage = "/person";

  @override
  void initRouter(Router router) {
    router.define(personPage,
        handler: Handler(handlerFunc: (_, params) => PersonalCenter()));
  }
}
