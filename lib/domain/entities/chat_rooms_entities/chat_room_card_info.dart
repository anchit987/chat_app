import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class ChatRoomCardInfo extends Equatable {
  final String chatRoomId;
  final String chatRoomName;
  final String photo;

  ChatRoomCardInfo({
    @required this.chatRoomId,
    @required this.chatRoomName,
    @required this.photo,
  });

  @override
  List<Object> get props => [chatRoomId, chatRoomName, photo];
}
