import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'authentication_bloc.dart';
import 'authentication_events.dart';
import 'login_events.dart';
import 'login_state.dart';
import 'user_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc bloc;

  LoginBloc({@required this.userRepository, @required this.bloc})
      : assert(userRepository != null),
        assert(bloc != null);

  @override
  LoginState get initialState => null;

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();
      try {
        final token = await userRepository.authenticate(
          userName: event.userName,
          password: event.password,
        );
        bloc.dispatch(LoginIn(token: token));
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
