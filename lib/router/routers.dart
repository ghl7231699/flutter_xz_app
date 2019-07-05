import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/mine/mine_router.dart';
import 'package:flutter_app/navigationbar/navigationbar.dart';
import 'package:flutter_app/router/router_init.dart';
import 'package:flutter_app/ui/widget/web_view_page.dart';

import '../404.dart';
import 'login_router.dart';

///router管理类

class Routers {
  static String home = "/home";
  static String webViewPage = "/webview";
  static List<IRouterProvider> _listProvider = [];

  static void configureRouters(Router router) {
    ///指定路由跳转错误返回页
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      debugPrint("未找到目标页");
      return WidgetNotFound();
    });

    router.define(home,
        handler: Handler(
            handlerFunc:
                (BuildContext context, Map<String, List<String>> params) =>
                    NavigationBarWidget()));

    router.define(webViewPage, handler: Handler(handlerFunc: (_, params) {
      String title = params['title']?.first;
      String url = params['url']?.first;
      return WebViewPage(title: title, url: url);
    }));

    _listProvider.clear();

    /// 各自路由由各自模块管理，统一在此添加初始化
    _listProvider.add(LoginRouter());
    _listProvider.add(PersonRouter());

    /// 初始化路由
    _listProvider.forEach((routerProvider) {
      routerProvider.initRouter(router);
    });
  }
}
