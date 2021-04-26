import 'package:chat_app/domain/entities/chat_rooms_entities/chat_room_card_info.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class ChatRoomCardList extends Equatable {
  final List<ChatRoomCardInfo> chatRoomCardInfoList;
  ChatRoomCardList({
    @required this.chatRoomCardInfoList,
  });

  @override
  List<Object> get props => [chatRoomCardInfoList];
}
