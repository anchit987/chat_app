import 'package:bloc/bloc.dart';
import 'package:chat_app/domain/entities/inputs_models/confirmed_password.dart';
import 'package:chat_app/domain/entities/inputs_models/email.dart';
import 'package:chat_app/domain/entities/inputs_models/password.dart';
import 'package:chat_app/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:formz/formz.dart';

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
      status: Formz.validate([
        state.email,
        state.password,
        state.confirmedPassword,
      ]),
    ));
  }

  Future<void> signUpFormSubmitted() {
    //TODO
  }
}
