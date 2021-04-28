import 'chat_room_card_info.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class UserChatRooms extends Equatable {
  final List<ChatRoomCardInfo> chatRoomCardInfoList;
  const UserChatRooms({
    @required this.chatRoomCardInfoList,
  });

  @override
  List<Object> get props => [chatRoomCardInfoList];
}
