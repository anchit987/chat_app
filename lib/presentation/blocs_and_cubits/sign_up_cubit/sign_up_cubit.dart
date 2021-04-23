import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../domain/entities/errors/auth_error.dart';
import '../../../domain/entities/inputs_models/confirmed_password.dart';
import '../../../domain/entities/inputs_models/email.dart';
import '../../../domain/entities/inputs_models/password.dart';
import '../../../domain/usecases/auth/sign_up_user.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUser _signUpUser;
  SignUpCubit(this._signUpUser)
      : assert(_signUpUser != null),
        super(const SignUpState());

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      authError: AuthError(AuthErrorType.noAuthError),
      status: Formz.validate([
        email,
        state.password,
        state.confirmedPassword,
      ]),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    final confirmedPassword = ConfirmedPassword.dirty(
      password: password.value,
      value: state.confirmedPassword.value,
    );
    emit(state.copyWith(
      password: password,
      confirmedPassword: confirmedPassword,
      authError: AuthError(AuthErrorType.noAuthError),
      status: Formz.validate([
        state.email,
        password,
        state.confirmedPassword,
      ]),
    ));
  }

  void confirmedPasswordChanged(String value) {
    final confirmedPassword = ConfirmedPassword.dirty(
      password: state.password.value,
      value: value,
    );

    emit(state.copyWith(
      confirmedPassword: confirmedPassword,
      authError: AuthError(AuthErrorType.noAuthError),
      status: Formz.validate([
        state.email,
        state.password,
        confirmedPassword,
      ]),
    ));
  }

  Future<void> signUpFormSubmitted() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    Map<String, String> map = {
      "email": state.email.value,
      "password": state.password.value,
    };
    final response = await _signUpUser(map);
    response.fold((authError) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
          authError: authError,
        ),
      );
    }, (success) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionSuccess,
        ),
      );
    });
  }
}
