import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'authentication_bloc.dart';
import 'authentication_events.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AuthenticationBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("我是首页"),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            onPressed: () {
              bloc.dispatch(LoginOut());
            },
            child: Text("退出登录"),
          ),
        ),
      ),
    );
  }
}
