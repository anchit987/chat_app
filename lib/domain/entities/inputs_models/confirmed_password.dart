import 'package:flutter/cupertino.dart';
import 'package:formz/formz.dart';

enum ConfirmedPasswordError { invalid }

class ConfirmedPassword extends FormzInput<String, ConfirmedPasswordError> {
  final String password;

  const ConfirmedPassword.pure({this.password = ''}) : super.pure('');
  const ConfirmedPassword.dirty({@required this.password, String value = ''})
      : super.dirty(value);

  @override
  ConfirmedPasswordError validator(String value) {
    return password == value ? null : ConfirmedPasswordError.invalid;
  }
}
