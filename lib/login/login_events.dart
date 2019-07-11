import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

///登录事件
abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const []]) : super(props);
}

class LoginButtonPressed extends LoginEvent {
  final String userName;
  final String password;

  LoginButtonPressed({@required this.userName, this.password})
      : super([userName, password]);

  @override
  String toString() {
    return 'LoginButtonPressed{userName: $userName, password: $password}';
  }
}

