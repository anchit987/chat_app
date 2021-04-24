import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Message extends Equatable {
  final String message;
  final String timeStamp;
  final String sentByUsername;
  final String userPhoto;
  Message({
    @required this.message,
    @required this.timeStamp,
    @required this.sentByUsername,
    @required this.userPhoto,
  });

  @override
  List<Object> get props => [message, timeStamp, sentByUsername, userPhoto];
}
