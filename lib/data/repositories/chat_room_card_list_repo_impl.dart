import 'package:chat_app/domain/entities/chat_rooms_entities/chat_room_card_list_entity.dart';
import 'package:chat_app/domain/entities/errors/app_error.dart';
import 'package:chat_app/domain/entities/user_entity.dart';
import 'package:chat_app/domain/repositories/chat_room_card_list_repository.dart';
import 'package:dartz/dartz.dart';

class ChatRoomCardListRepositoryImpl implements ChatRoomCardListRepository {
  @override
  Future<ChatRoomCardList> getAllChatRoomCards(User user) {
    // TODO: implement getAllChatRoomCards
    throw UnimplementedError();
  }
}
