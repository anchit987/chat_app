import 'package:dartz/dartz.dart';

import '../../entities/errors/auth_error.dart';
import '../../repositories/auth_repository.dart';
import 'auth_usecase.dart';

class SignInUser extends AuthUseCase<bool, Map<String, String>> {
  final AuthRepository _authRepository;

  SignInUser(this._authRepository);

  @override
  Future<Either<AuthError, bool>> call(Map<String, String> map) async {
    final response = await _authRepository.signInWithEmailAndPassword(
      email: map["email"],
      password: map["password"],
    );
    return response;
  }
}
