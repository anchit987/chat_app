import 'package:dartz/dartz.dart';

import '../entities/errors/app_error.dart';

abstract class UseCase<Type, Params> {
  Future<Either<AppError, Type>> call(Params params);
}
