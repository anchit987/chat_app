import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String email;
  final String password;

  const User({
    this.email,
    this.password,
  })  : assert(email != null, 'Email cannot be null'),
        assert(password != null, 'Password cannot be null');

  @override
  List<Object> get props => [email, password];
}
