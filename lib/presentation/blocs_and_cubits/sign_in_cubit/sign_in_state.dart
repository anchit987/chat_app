part of 'sign_in_cubit.dart';

class SignInState extends Equatable {
  final Email email;
  final Password password;
  final FormzStatus status;
  final AuthError authError;

  const SignInState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.authError = const AuthError(AuthErrorType.noAuthError),
    this.status = FormzStatus.pure,
  });

  @override
  List<Object> get props => [email, password, authError, status];

  SignInState copyWith({
    Email email,
    Password password,
    AuthError authError,
    FormzStatus status,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      authError: authError ?? this.authError,
      status: status ?? this.status,
    );
  }
}
