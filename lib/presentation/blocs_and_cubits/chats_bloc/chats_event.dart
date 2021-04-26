part of 'chats_bloc.dart';

abstract class ChatsEvent extends Equatable {
  const ChatsEvent();

  @override
  List<Object> get props => [];
}

class ChatsLoadEvent extends ChatsEvent {
  final String chatRoomId;

  ChatsLoadEvent({this.chatRoomId});

  @override
  List<Object> get props => [chatRoomId];
}
