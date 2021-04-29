import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/user_entity.dart' as myUser;
import '../../domain/repositories/user_repository.dart';
import '../models/user_model.dart';

class UserRepositoryImpl extends UserRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;

  UserRepositoryImpl(this._firestore, this._firebaseAuth);

  @override
  Stream<myUser.User> get user async* {
    yield* _firestore
        .collection("users")
        .doc(_firebaseAuth.currentUser.uid)
        .snapshots()
        .map((event) => UserModel.fromMap(event.data()));
  }
}
