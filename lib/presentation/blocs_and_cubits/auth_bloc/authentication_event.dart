part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationUserChanged extends AuthenticationEvent {
  final UserUid uid;

  const AuthenticationUserChanged(this.uid);

  @override
  List<Object> get props => [uid];
}

class AuthenticationLogoutRequest extends AuthenticationEvent {}
