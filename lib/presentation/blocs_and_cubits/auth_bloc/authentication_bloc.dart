import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_app/domain/entities/user_uid.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/repositories/auth_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepository _authRepository;
  StreamSubscription<UserUid> _uidSubscription;

  AuthenticationBloc(AuthRepository authRepository)
      : assert(authRepository != null),
        _authRepository = authRepository,
        super(const AuthenticationState.unknown()) {
    //? whenever new user comes it listen and AuthenticationUserChanged
    //? event called automatically
    _uidSubscription = _authRepository.uid
        .listen((uid) => add(AuthenticationUserChanged(uid)));
  }

  @override
  Future<void> close() {
    _uidSubscription?.cancel();
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
      await _authRepository.signOut();
    }
  }

  AuthenticationState _mapAuthenticationUserChangedToState(
      AuthenticationUserChanged event) {
    return event.uid != UserUid.empty
        ? AuthenticationState.authenticated(event.uid)
        : AuthenticationState.unauthenticated();
  }
}
