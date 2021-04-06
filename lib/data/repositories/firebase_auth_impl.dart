import 'package:chat_app/domain/entities/errors/auth_error.dart';
import 'package:chat_app/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthImpl extends AuthRepository {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthImpl(this._firebaseAuth);

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
    } on FirebaseAuthException catch (e) {
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
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found" || e.code == "wrong-password") {
        return left(AuthError(AuthErrorType.emailOrPasswordNoMatch));
      } else if (e.code == "user-disabled")
        return left(AuthError(AuthErrorType.userDisabled));
    }
    return left(AuthError(AuthErrorType.unknownError));
  }
}
