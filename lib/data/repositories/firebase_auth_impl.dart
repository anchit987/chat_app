import 'package:chat_app/domain/entities/inputs_models/email.dart';
import 'package:chat_app/domain/entities/user_uid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import '../../domain/entities/errors/auth_error.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_sources/firestore_data_sources.dart';

class FirebaseAuthImpl implements AuthRepository {
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final FirestoreDataSources _firestoreDataSources;
  FirebaseAuthImpl(this._firebaseAuth, this._firestoreDataSources);

  @override
  Stream<UserUid> get uid {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      return firebaseUser == null ? UserUid.empty : firebaseUser.toUser;
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
      //* On sign up new user will be added to the firestore
      _firestoreDataSources.addUserToFirestore();

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
      return right(true);
    } on firebase_auth.FirebaseAuthException catch (e) {
      if (e.code == "user-not-found" || e.code == "wrong-password") {
        return left(AuthError(AuthErrorType.emailOrPasswordNotMatch));
      } else if (e.code == "user-disabled")
        return left(AuthError(AuthErrorType.userDisabled));
    }
    return left(AuthError(AuthErrorType.unknownError));
  }

  @override
  Future<Either<AuthError, bool>> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return right(true);
    } catch (e) {
      return left(AuthError(AuthErrorType.unknownError));
    }
  }
}

extension on firebase_auth.User {
  UserUid get toUser {
    return UserUid(uid: uid);
  }
}
