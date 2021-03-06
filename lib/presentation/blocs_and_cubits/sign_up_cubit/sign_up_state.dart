part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  final Email email;
  final Password password;
  final ConfirmedPassword confirmedPassword;
  final FormzStatus status;
  final AuthError authError;

  const SignUpState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.confirmedPassword = const ConfirmedPassword.pure(),
    this.authError = const AuthError(AuthErrorType.noAuthError),
    this.status = FormzStatus.pure,
  });

  @override
  List<Object> get props =>
      [email, password, confirmedPassword, authError, status];

  SignUpState copyWith({
    Email email,
    Password password,
    ConfirmedPassword confirmedPassword,
    AuthError authError,
    FormzStatus status,
  }) {
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmedPassword: confirmedPassword ?? this.confirmedPassword,
      authError: authError ?? this.authError,
      status: status ?? this.status,
    );
  }
}
