import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:chat_app/domain/entities/user_entity.dart';

class UserModel extends User {
  final String uid;
  final String email;
  final String username;
  final String photo;
  final String status;
  final List<String> friends;
  final List<String> friendRequests;
  final List<String> pendingRequests;
  final List<String> chatRoomids;

  UserModel({
    @required this.uid,
    @required this.email,
    @required this.username,
    @required this.photo,
    @required this.status,
    @required this.friends,
    @required this.friendRequests,
    @required this.pendingRequests,
    @required this.chatRoomids,
  }) : super(
          uid: uid,
          email: email,
          username: username,
          photo: photo,
          status: status,
          friends: friends,
          friendRequests: friendRequests,
          pendingRequests: pendingRequests,
          chatRoomids: chatRoomids,
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
      'chatRoomids': chatRoomids,
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
      chatRoomids: List<String>.from(map['chatRoomids']) ?? [],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
