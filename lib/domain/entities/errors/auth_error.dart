class AuthError {
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
