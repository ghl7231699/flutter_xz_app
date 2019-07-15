import 'package:equatable/equatable.dart';

///用户状态
abstract class AuthenticationState extends Equatable {}

///未初始化
class AuthenticationUninitialized extends AuthenticationState {
  @override
  String toString() => 'AuthenticationUninitialized';
}

///验证通过
class AuthenticationAuthenticated extends AuthenticationState {
  @override
  String toString() => 'AuthenticationAuthenticated';
}

///验证失败
class AuthenticationFailed extends AuthenticationState {
  @override
  String toString() => 'AuthenticationFailed';
}

///未登录
class AuthenticationUnauthenticated extends AuthenticationState {
  @override
  String toString() => 'AuthenticationUnauthenticated';
}

class AuthenticationLoading extends AuthenticationState {
  @override
  String toString() => 'AuthenticationLoading';
}
