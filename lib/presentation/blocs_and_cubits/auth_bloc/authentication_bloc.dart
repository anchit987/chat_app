import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_app/domain/entities/user_entity.dart';
import 'package:chat_app/domain/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:pedantic/pedantic.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepository _authRepository;

  AuthenticationBloc(AuthRepository authRepository)
      : assert(authRepository != null),
        _authRepository = authRepository,
        super(const AuthenticationState.unknown());

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
