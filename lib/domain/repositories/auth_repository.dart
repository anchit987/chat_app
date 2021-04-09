import 'package:chat_app/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../entities/errors/auth_error.dart';

abstract class AuthRepository {
  Stream<User> get user;
  
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
