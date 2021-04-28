import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class User extends Equatable {
  final String email;
  final String uid;
  final String username;
  final String photo;
  final String status;
  final List<String> friends;
  final List<String> friendRequests;
  final List<String> pendingRequests;
  final String userChatRoomsid;

  const User({
    @required this.email,
    @required this.uid,
    @required this.username,
    @required this.photo,
    @required this.status,
    @required this.friends,
    @required this.friendRequests,
    @required this.pendingRequests,
    @required this.userChatRoomsid,
  })  : assert(email != null),
        assert(uid != null);

  @override
  List<Object> get props => [
        email,
        uid,
        username,
        photo,
        status,
        friends,
        friendRequests,
        pendingRequests,
        userChatRoomsid
      ];
}
