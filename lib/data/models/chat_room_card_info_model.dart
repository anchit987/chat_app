import 'package:flutter/cupertino.dart';

import '../../domain/entities/chat_rooms_entities/chat_room_card_info.dart';

class ChatRoomCardInfoModel extends ChatRoomCardInfo {
  final String chatRoomId;
  final String chatRoomName;
  final String photo;
  final String type;
  final List<String> useruids;
  final List<String> admins;

  ChatRoomCardInfoModel({
    @required this.chatRoomId,
    @required this.chatRoomName,
    @required this.photo,
    @required this.type,
    @required this.useruids,
    @required this.admins,
  }) : super(
          chatRoomId: chatRoomId,
          chatRoomName: chatRoomName,
          photo: photo,
          type: type,
          useruids: useruids,
          admins: admins,
        );

  Map<String, dynamic> toMap() {
    return {
      'chatRoomId': chatRoomId,
      'chatRoomName': chatRoomName,
      'photo': photo,
      'type': type,
      'useruids': useruids,
      'admins': admins,
    };
  }

  factory ChatRoomCardInfoModel.fromMap(Map<String, dynamic> map) {
    return ChatRoomCardInfoModel(
      chatRoomId: map['chatRoomId'],
      chatRoomName: map['chatRoomName'],
      photo: map['photo'] ?? "",
      type: map['type'],
      useruids: List<String>.from(map['useruids']),
      admins: List<String>.from(map['admins']),
    );
  }
}
