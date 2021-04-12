import 'package:bloc/bloc.dart';
import 'package:chat_app/domain/entities/errors/auth_error.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../domain/entities/inputs_models/confirmed_password.dart';
import '../../../domain/entities/inputs_models/email.dart';
import '../../../domain/entities/inputs_models/password.dart';
import '../../../domain/repositories/auth_repository.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepository _authRepository;
  SignUpCubit(this._authRepository)
      : assert(_authRepository != null),
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
    emit(state.copyWith(
      password: password,
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
        state.confirmedPassword,
      ]),
    ));
  }

  Future<void> signUpFormSubmitted() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    final response = await _authRepository.registerWithEmailAndPassword(
      email: state.email.value,
      password: state.password.value,
    );

    response.fold((authError) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
          authError: authError,
        ),
      );
    }, (success) {
      state.copyWith(
        status: FormzStatus.submissionSuccess,
      );
    });
  }
}
