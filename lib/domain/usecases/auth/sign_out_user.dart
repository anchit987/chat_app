import 'package:dartz/dartz.dart';

import '../../entities/errors/auth_error.dart';
import '../../entities/no_params.dart';
import '../../repositories/auth_repository.dart';
import 'auth_usecase.dart';

class SignOut extends AuthUseCase<bool, NoParams> {
  final AuthRepository _authRepository;

  SignOut(this._authRepository);

  @override
  Future<Either<AuthError, bool>> call(NoParams _) async {
    final response = await _authRepository.signOut();
    return response;
  }
}
