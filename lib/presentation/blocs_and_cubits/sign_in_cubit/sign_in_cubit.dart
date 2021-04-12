import 'package:bloc/bloc.dart';
import 'package:chat_app/common/constants/route_constants.dart';
import 'package:chat_app/domain/entities/errors/auth_error.dart';
import 'package:chat_app/domain/entities/inputs_models/email.dart';
import 'package:chat_app/domain/entities/inputs_models/password.dart';
import 'package:chat_app/domain/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:formz/formz.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthRepository _authRepository;
  SignInCubit(this._authRepository)
      : assert(_authRepository != null),
        super(const SignInState());

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      authError: AuthError(AuthErrorType.noAuthError),
      status: Formz.validate([
        email,
        state.password,
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
      ]),
    ));
  }

  Future<void> signInFormSubmitted() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    final response = await _authRepository.signInWithEmailAndPassword(
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
