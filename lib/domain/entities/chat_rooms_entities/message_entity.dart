import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Message extends Equatable {
  final String message;
  final Timestamp timeStamp;
  final String sentByUid;
  Message({
    @required this.message,
    @required this.timeStamp,
    @required this.sentByUid,
  });

  @override
  List<Object> get props => [message, timeStamp, sentByUid];
}
