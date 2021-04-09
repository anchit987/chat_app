import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pedantic/pedantic.dart';

import '../../../domain/entities/user_entity.dart';
import '../../../domain/repositories/auth_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepository _authRepository;
  StreamSubscription<User> _userSubscription;

  AuthenticationBloc(AuthRepository authRepository)
      : assert(authRepository != null),
        _authRepository = authRepository,
        super(const AuthenticationState.unknown()) {
    _userSubscription = _authRepository.user
        .listen((user) => add(AuthenticationUserChanged(user)));
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AuthenticationUserChanged) {
      yield _mapAuthenticationUserChangedToState(event);
    } else if (event is AuthenticationLogoutRequest) {
      // the background process should not freezed the screen
      unawaited(_authRepository.signOut());
    }
  }

  AuthenticationState _mapAuthenticationUserChangedToState(
      AuthenticationUserChanged event) {
    return event.user != User.empty
        ? AuthenticationState.authenticated(event.user)
        : AuthenticationState.unauthenticated();
  }
}
