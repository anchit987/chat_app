import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../entities/errors/auth_error.dart';
import '../entities/user_uid.dart';

abstract class AuthRepository {
  Stream<UserUid> get uid;

  Future<Either<AuthError, bool>> registerWithEmailAndPassword({
    @required String email,
    @required String password,
  });

  Future<Either<AuthError, bool>> signInWithEmailAndPassword({
    @required String email,
    @required String password,
  });

  Future<Either<AuthError, bool>> signOut();
}
