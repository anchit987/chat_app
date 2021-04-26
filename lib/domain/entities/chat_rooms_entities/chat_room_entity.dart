import 'package:chat_app/domain/entities/chat_rooms_entities/message_entity.dart';
import 'package:chat_app/domain/entities/chat_rooms_entities/user_info.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class ChatRoom extends Equatable {
  final String chatRoomId;
  final String chatRoomName;
  final List<UserCardInfoInChatRoom> users;
  final List<Message> messages;

  ChatRoom({
    @required this.chatRoomId,
    @required this.chatRoomName,
    @required this.users,
    @required this.messages,
  });

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
