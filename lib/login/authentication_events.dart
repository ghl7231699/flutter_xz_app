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

class LoginIn extends AuthenticationEvent {
  final String token;

  LoginIn({@required this.token}) : super([token]);

  @override
  String toString() {
    return 'LoginIn{token: $token}';
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
