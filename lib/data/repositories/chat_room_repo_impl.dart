import 'package:chat_app/domain/entities/chat_rooms_entities/chat_room_entity.dart';
import 'package:chat_app/domain/repositories/chat_room_repository.dart';

class ChatRoomRepositoryImpl implements ChatRoomRepository {
  @override
  // TODO: implement chatRoomStream
  Stream<ChatRoom> get chatRoomStream => throw UnimplementedError();

  @override
  Future<void> getChatRoom(String chatRoomId) {
    // TODO: implement getChatRoom
    throw UnimplementedError();
  }
}
