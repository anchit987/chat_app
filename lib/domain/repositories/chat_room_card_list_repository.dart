import '../entities/chat_rooms_entities/user_chat_rooms.dart';

abstract class ChatRoomCardListRepository {
  Stream<UserChatRooms> get userChatRooms;
}
