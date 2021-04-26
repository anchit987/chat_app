import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class UserCardInfoInChatRoom extends Equatable {
  final String uid;
  final String username;
  final String photo;
  final bool isAdmin;

  UserCardInfoInChatRoom({
    @required this.uid,
    @required this.username,
    @required this.photo,
    @required this.isAdmin,
  });
  @override
  List<Object> get props => [uid, username, photo, isAdmin];
} 
