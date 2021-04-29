import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/chat_rooms_entities/user_chat_rooms.dart';
import '../../domain/repositories/chat_room_card_list_repository.dart';
import '../models/user_chat_rooms_model.dart';

class ChatRoomCardListRepositoryImpl implements ChatRoomCardListRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseauth;
  ChatRoomCardListRepositoryImpl(this._firestore, this._firebaseauth);

  @override
  Stream<UserChatRoomsModel> get userChatRooms async* {
    yield* _firestore
        .collection("user-chat-rooms")
        .doc(_firebaseauth.currentUser.uid)
        .snapshots()
        .map((event) {
      final data = event.data();
      print(data);
      return data == null
          ? UserChatRoomsModel.empty
          : UserChatRoomsModel.fromMap(event.data());
    });
  }
}
