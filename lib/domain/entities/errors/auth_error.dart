import 'package:equatable/equatable.dart';

class AuthError extends Equatable {
  final AuthErrorType authErrorType;

  const AuthError(this.authErrorType);

  @override
  List<Object> get props => [authErrorType];
}

enum AuthErrorType {
  noAuthError,
  emailAlreadyInUse,
  emailOrPasswordNotMatch,
  userDisabled,
  unknownError,
}
