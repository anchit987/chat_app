part of 'authentication_bloc.dart';

// initially when app opens it is in unknown state
enum AuthenticationStatus { authenticated, unauthenticated, unknown }

class AuthenticationState extends Equatable {
  final AuthenticationStatus status;
  final UserUid uid;

  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.uid = UserUid.empty,
  });

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated(UserUid uid)
      : this._(status: AuthenticationStatus.authenticated, uid: uid);

  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  @override
  List<Object> get props => [status, uid];
}
