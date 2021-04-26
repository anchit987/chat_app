import 'package:chat_app/domain/entities/chat_rooms_entities/chat_room_card_list_entity.dart';
import 'package:chat_app/domain/entities/user_entity.dart';

abstract class ChatRoomCardListRepository {
  Future<ChatRoomCardList> getAllChatRoomCards(User user);
}
