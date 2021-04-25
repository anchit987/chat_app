import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

abstract class FirestoreDataSources {
  Future<void> addUserToUserList(firebase_auth.UserCredential userCredential);
  Future<void> addUserToFirestore(firebase_auth.UserCredential userCredential);
}

class FirestoreDataSourcesImpl implements FirestoreDataSources {
  Future<void> addUserToFirestore(
      firebase_auth.UserCredential userCredential) async {
    final uid = userCredential.user.uid;
    final users = FirebaseFirestore.instance.collection("users").doc(uid);
    await users.set({
      "uid": uid,
      "username": userCredential.user.email,
      "email": userCredential.user.email,
      "status": "Hey there! I am using ChatApp",
      "photo": "",
      "friends": [],
      "friend-requests": [],
      "pending-requests": [],
    });
    await addUserToUserList(userCredential);
  }

  @override
  Future<void> addUserToUserList(
      firebase_auth.UserCredential userCredential) async {
    final uid = userCredential.user.uid;
    await FirebaseFirestore.instance
        .collection("users")
        .doc("all_users_with_username")
        .update({
      uid: {
        "username": userCredential.user.email,
        "status": "Hey there! I am using ChatApp",
        "photo": "",
      }
    });
  }
}
