import 'package:flutter/material.dart';

import '../../domain/entities/chat_rooms_entities/user_chat_rooms.dart';
import 'chat_room_card_info_model.dart';

class UserChatRoomsModel extends UserChatRooms {
  final List<ChatRoomCardInfoModel> chatRoomCardInfoListModel;
  const UserChatRoomsModel({
    @required this.chatRoomCardInfoListModel,
  }) : super(chatRoomCardInfoList: chatRoomCardInfoListModel);

  static const empty = UserChatRoomsModel(chatRoomCardInfoListModel: []);

  factory UserChatRoomsModel.fromMap(Map<String, dynamic> map) {
    return UserChatRoomsModel(
      chatRoomCardInfoListModel: (map["chat-rooms"] as List)
          .map((e) => new ChatRoomCardInfoModel.fromMap(e))
          .toList(),
    );
  }
}
