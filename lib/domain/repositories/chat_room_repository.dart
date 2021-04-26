import 'package:chat_app/domain/entities/chat_rooms_entities/chat_room_entity.dart';

abstract class ChatRoomRepository {
  Stream<ChatRoom> get chatRoomStream;

  Future<void> getChatRoom(String chatRoomId);
}
