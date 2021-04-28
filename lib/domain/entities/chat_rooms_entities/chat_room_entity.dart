import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import 'message_entity.dart';

class ChatRoom extends Equatable {
  final String chatRoomId;
  final List<Message> messages;

  ChatRoom({
    @required this.chatRoomId,
    @required this.messages,
  });

  @override
  List<Object> get props => [messages];
}
