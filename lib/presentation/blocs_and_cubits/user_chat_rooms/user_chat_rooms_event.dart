part of 'user_chat_rooms_bloc.dart';

abstract class UserChatRoomsEvent extends Equatable {
  const UserChatRoomsEvent();

  @override
  List<Object> get props => [];
}

class UserChatRoomsLoadEvent extends UserChatRoomsEvent {
  final UserChatRooms userChatRooms;

  const UserChatRoomsLoadEvent({this.userChatRooms});

  @override
  List<Object> get props => [userChatRooms];
}
