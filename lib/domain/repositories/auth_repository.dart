import 'package:chat_app/domain/entities/errors/auth_error.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

abstract class AuthRepository {
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
