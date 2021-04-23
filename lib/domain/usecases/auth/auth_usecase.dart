import 'package:dartz/dartz.dart';

import '../../entities/errors/auth_error.dart';

abstract class AuthUseCase<Type, Params> {
  Future<Either<AuthError, Type>> call(Params params);
}
