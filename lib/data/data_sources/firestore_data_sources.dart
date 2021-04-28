import 'package:chat_app/data/models/chat_room_card_info_model.dart';
import 'package:chat_app/data/models/user_chat_rooms_model.dart';
import 'package:chat_app/data/models/user_model.dart';
import 'package:chat_app/domain/entities/chat_rooms_entities/chat_room_card_info.dart';
import 'package:chat_app/presentation/screens/home/chat_rooms_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FirestoreDataSources {
  Future<void> addUserToUserList();
  Future<void> addUserToFirestore();
}

class FirestoreDataSourcesImpl implements FirestoreDataSources {
  final FirebaseAuth _firebaseAuth;
  FirestoreDataSourcesImpl(this._firebaseAuth);
  Future<void> addUserToFirestore() async {
    final uid = _firebaseAuth.currentUser.uid;
    final users = FirebaseFirestore.instance.collection("users").doc(uid);
    await users.set(UserModel(
      uid: uid,
      username: _firebaseAuth.currentUser.email,
      email: _firebaseAuth.currentUser.email,
      status: "Hey there! I am using ChatApp",
      photo: "",
      friends: [],
      friendRequests: [],
      pendingRequests: [],
      userChatRoomsid: uid,
    ).toMap());
    //TODO: Remove it
    await FirebaseFirestore.instance
        .collection("user-chat-rooms")
        .doc(uid)
        .set({
      "chat-rooms": [
        ChatRoomCardInfoModel(
            chatRoomId: "",
            chatRoomName: "anchit",
            photo: "",
            type: "",
            useruids: [],
            admins: []).toMap(),
        ChatRoomCardInfoModel(
            chatRoomId: "",
            chatRoomName: "gangrade",
            photo: "",
            type: "",
            useruids: [],
            admins: []).toMap(),
      ]
    });

    await addUserToUserList();
  }

  @override
  Future<void> addUserToUserList() async {
    final uid = _firebaseAuth.currentUser.uid;
    await FirebaseFirestore.instance
        .collection("search")
        .doc("all-users")
        .update({
      uid: {
        "username": _firebaseAuth.currentUser.email,
        "status": "Hey there! I am using ChatApp",
        "photo": "",
      }
    });
  }
}
