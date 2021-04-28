part of 'user_chat_rooms_bloc.dart';

abstract class UserChatRoomsState extends Equatable {
  const UserChatRoomsState();

  @override
  List<Object> get props => [];
}

class UserChatRoomsInitial extends UserChatRoomsState {
  const UserChatRoomsInitial();
}

class UserChatRoomsLoadedState extends UserChatRoomsState {
  final UserChatRooms userChatRooms;

  const UserChatRoomsLoadedState({this.userChatRooms});

  @override
  List<Object> get props => [userChatRooms];
}
