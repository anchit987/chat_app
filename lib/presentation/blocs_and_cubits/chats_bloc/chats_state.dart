part of 'chats_bloc.dart';

abstract class ChatsState extends Equatable {
  const ChatsState();

  @override
  List<Object> get props => [];
}

class ChatsInitial extends ChatsState {}

class ChatRoomsLoad extends ChatsState {
  // final ChatRoomList chatRooms;

  // ChatRoomsLoad({@required this.chatRooms});

  // @override
  // List<Object> get props => [chatRooms];
}
