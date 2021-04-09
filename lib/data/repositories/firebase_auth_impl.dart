import 'package:chat_app/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import '../../domain/entities/errors/auth_error.dart';
import '../../domain/repositories/auth_repository.dart';

class FirebaseAuthImpl implements AuthRepository {
  final firebase_auth.FirebaseAuth _firebaseAuth;

  FirebaseAuthImpl(this._firebaseAuth);

  @override
  Stream<User> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      return firebaseUser == null ? User.empty : firebaseUser.toUser;
    });
  }

  @override
  Future<Either<AuthError, bool>> registerWithEmailAndPassword(
      {String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      //* ON SUCCESS
      return right(true);
    } on firebase_auth.FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        return left(AuthError(AuthErrorType.emailAlreadyInUse));
      }
    }
    return left(AuthError(AuthErrorType.unknownError));
  }

  @override
  Future<Either<AuthError, bool>> signInWithEmailAndPassword(
      {String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on firebase_auth.FirebaseAuthException catch (e) {
      if (e.code == "user-not-found" || e.code == "wrong-password") {
        return left(AuthError(AuthErrorType.emailOrPasswordNotMatch));
      } else if (e.code == "user-disabled")
        return left(AuthError(AuthErrorType.userDisabled));
    }
    return left(AuthError(AuthErrorType.unknownError));
  }

  @override
  Future<Either<AuthError, bool>> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}

extension on firebase_auth.User {
  User get toUser {
    return User(id: uid, email: email, name: displayName, photo: photoURL);
  }
}
