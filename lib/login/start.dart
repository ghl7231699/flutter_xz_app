import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/login/user_repository.dart';
import 'package:flutter_app/navigationbar/navigationbar.dart';
import 'package:flutter_app/ui/splash_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'authentication_bloc.dart';
import 'authentication_events.dart';
import 'authentication_state.dart';
import 'loading.dart';
import 'login_page.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition.event);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error.toString());
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UserRepository();
  runApp(
    BlocProvider<AuthenticationBloc>(
      builder: (context) {
        return AuthenticationBloc(userRepository: userRepository)
          ..dispatch(AppStarted());
      },
      child: App(userRepository: userRepository),
    ),
  );
}

class App extends StatelessWidget {
  final UserRepository userRepository;

  App({Key key, @required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthenticationEvent, AuthenticationState>(
        bloc: BlocProvider.of<AuthenticationBloc>(context),
        builder: (BuildContext context, AuthenticationState state) {
          if (state is AuthenticationUninitialized) {
            return SplashPage(
              userRepository: userRepository,
            );
          }
          if (state is AuthenticationAuthenticated) {
            //验证通过
            return NavigationBarWidget();
          }
          if (state is AuthenticationUnauthenticated) {
            //本地未注册
            return LoginPage(userRepository: userRepository);
          }
          if (state is AuthenticationLoading) {
            //加载中
            return LoadingIndicator();
          }
          return SplashPage(
            userRepository: userRepository,
          );
        },
      ),
    );
  }
}
