import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../domain/entities/errors/auth_error.dart';
import '../../../domain/entities/inputs_models/email.dart';
import '../../../domain/entities/inputs_models/password.dart';
import '../../../domain/usecases/auth/sign_in_user.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final SignInUser _signInUser;
  SignInCubit(this._signInUser)
      : assert(_signInUser != null),
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

    Map<String, String> map = {
      "email": state.email.value,
      "password": state.password.value,
    };

    final response = await _signInUser(map);

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
