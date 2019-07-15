import 'package:bloc/bloc.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/login/authentication_bloc.dart';
import 'package:flutter_app/login/authentication_events.dart';
import 'package:flutter_app/login/authentication_state.dart';
import 'package:flutter_app/login/user_repository.dart';
import 'package:flutter_app/navigationbar/navigationbar.dart';
import 'package:flutter_app/router/application.dart';
import 'package:flutter_app/router/routers.dart';
import 'package:flutter_app/ui/page/user_login_main_page.dart';
import 'package:flutter_app/ui/splash_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///引导页
///TODO  添加引导页+开屏广告

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UserRepository();
  guidePageWidget();
  runApp(
    BlocProvider<AuthenticationBloc>(
      builder: (context) {
        return AuthenticationBloc(userRepository: userRepository)
          ..dispatch(AppStarted());
      },
      child: GuidePageWidget(
        userRepository: userRepository,
      ),
    ),
  );
}

void guidePageWidget() {
  final router = Router();
  Routers.configureRouters(router);
  Application.router = router;
}

class GuidePageWidget extends StatelessWidget {
  final UserRepository userRepository;

  GuidePageWidget({Key key, @required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthenticationEvent, AuthenticationState>(
        bloc: BlocProvider.of<AuthenticationBloc>(context),
        builder: (BuildContext context, AuthenticationState state) {
          //启动开屏页
          if (state is AuthenticationUninitialized) {
            return SplashPage(
              userRepository: userRepository,
            );
          }
          if (state is AuthenticationAuthenticated) {
            //验证通过----->首页
            return NavigationBarWidget();
          }
          if (state is AuthenticationUnauthenticated) {
            //未注册登录---->登录
            return UserLoginMainPage();
          }
          //默认返回登录界面
          return UserLoginMainPage();
        },
      ),
    );
  }
}
