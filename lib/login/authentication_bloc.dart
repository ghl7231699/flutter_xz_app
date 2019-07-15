import 'package:bloc/bloc.dart';
import 'package:flutter_app/login/user_repository.dart';
import 'package:meta/meta.dart';

import 'authentication_events.dart';
import 'authentication_state.dart';

///
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationBloc({@required this.userRepository})
      : assert(userRepository != null);

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AppStarted) {
      ///检测本地是否保存有token及用户信息
      final bool hasToken = await userRepository.hasToken();
      if (hasToken) {
        try {
          ///如果有 则验证
          ///获取本地保存数据  TODO
          await userRepository.authenticate(
              userName: 'dalin', password: '123456');
//          dispatch(LoginSucceed());
        } catch (error) {
//          dispatch(LoginFailed());
          yield AuthenticationUnauthenticated();
        }
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoginSucceed) {
      yield AuthenticationAuthenticated();
    }

    if (event is LoginFailed) {
      yield AuthenticationUnauthenticated();
//      yield AuthenticationFailed();
    }
//    if (event is LoginIn) {
////      yield AuthenticationLoading();
//      await userRepository.persistToken(event.token);
//      yield AuthenticationAuthenticated();
//    }
//    if (event is LoginFailed) {
//      yield AuthenticationUnauthenticated();
//    }
//
//    if (event is LoginOut) {
//      yield AuthenticationLoading();
//      await userRepository.deleteToken();
//      yield AuthenticationUnauthenticated();
//    }
  }
}
