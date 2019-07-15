import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

///登录事件
abstract class AuthenticationEvent extends Equatable {
  AuthenticationEvent([List props = const []]) : super(props);
}

class AppStarted extends AuthenticationEvent {
  @override
  String toString() {
    return 'AppStarted';
  }
}

///登录验证中
class Logging extends AuthenticationEvent {
  @override
  String toString() {
    return 'Logging';
  }
}

///登录
class LoginIn extends AuthenticationEvent {
  final String token;

  LoginIn({@required this.token}) : super([token]);

  @override
  String toString() {
    return 'LoginIn{token: $token}';
  }
}

///登录成功
class LoginSucceed extends AuthenticationEvent {
  @override
  String toString() {
    return 'LoginSucceed';
  }
}

class LoginOut extends AuthenticationEvent {
  @override
  String toString() {
    return 'LoginOut';
  }
}

class LoginFailed extends AuthenticationEvent {
  @override
  String toString() {
    return 'LoginFailed';
  }
}
