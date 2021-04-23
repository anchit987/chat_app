import 'package:dartz/dartz.dart';

import '../../entities/errors/auth_error.dart';
import '../../repositories/auth_repository.dart';
import 'auth_usecase.dart';

class SignUpUser extends AuthUseCase<bool, Map<String, String>> {
  final AuthRepository _authRepository;

  SignUpUser(this._authRepository);

  @override
  Future<Either<AuthError, bool>> call(Map<String, String> map) async {
    final response = await _authRepository.registerWithEmailAndPassword(
      email: map["email"],
      password: map["password"],
    );
    return response;
  }
}
