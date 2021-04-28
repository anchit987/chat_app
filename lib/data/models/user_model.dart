import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../domain/entities/user_entity.dart';

class UserModel extends User {
  final String uid;
  final String email;
  final String username;
  final String photo;
  final String status;
  final List<String> friends;
  final List<String> friendRequests;
  final List<String> pendingRequests;
  final String userChatRoomsid;

  UserModel({
    @required this.uid,
    @required this.email,
    @required this.username,
    @required this.photo,
    @required this.status,
    @required this.friends,
    @required this.friendRequests,
    @required this.pendingRequests,
    @required this.userChatRoomsid,
  }) : super(
          uid: uid,
          email: email,
          username: username,
          photo: photo,
          status: status,
          friends: friends,
          friendRequests: friendRequests,
          pendingRequests: pendingRequests,
          userChatRoomsid: userChatRoomsid,
        );

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'username': username,
      'photo': photo,
      'status': status,
      'friends': friends,
      'friendRequests': friendRequests,
      'pendingRequests': pendingRequests,
      'userChatRoomsid': userChatRoomsid,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      username: map['username'],
      photo: map['photo'] ?? "",
      status: map['status'] ?? "",
      friends: List<String>.from(map['friends']) ?? [],
      friendRequests: List<String>.from(map['friendRequests']) ?? [],
      pendingRequests: List<String>.from(map['pendingRequests']) ?? [],
      userChatRoomsid: map['userChatRoomsid'],
    );
  }
}
