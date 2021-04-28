import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class ChatRoomCardInfo extends Equatable {
  final String chatRoomId;
  final String chatRoomName;
  final String photo;
  final String type;
  final List<String> useruids;
  final List<String> admins;

  ChatRoomCardInfo({
    @required this.chatRoomId,
    @required this.chatRoomName,
    @required this.photo,
    @required this.type,
    @required this.useruids,
    @required this.admins,
  });

  @override
  List<Object> get props =>
      [chatRoomId, chatRoomName, photo, type, useruids, admins];
}
