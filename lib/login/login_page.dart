import 'package:flutter/material.dart';
import 'package:flutter_app/login/user_repository.dart';
import 'package:flutter_app/ui/page/user_phone_login_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'authentication_bloc.dart';
import 'login_bloc.dart';

class LoginPage extends StatelessWidget {
  final UserRepository userRepository;

  LoginPage({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        builder: (context) {
          return LoginBloc(
            bloc: BlocProvider.of<AuthenticationBloc>(context),
            userRepository: userRepository,
          );
        },
//        child: LoginForm(),
        child: UserPhoneLoginPage(),
      ),
    );
  }
}
