import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/chat_rooms_entities/user_chat_rooms.dart';
import '../../../domain/repositories/chat_room_card_list_repository.dart';
import '../../../domain/repositories/user_repository.dart';

part 'user_chat_rooms_event.dart';
part 'user_chat_rooms_state.dart';

class UserChatRoomsBloc extends Bloc<UserChatRoomsEvent, UserChatRoomsState> {
  final ChatRoomCardListRepository _chatRoomCardListRepository;
  StreamSubscription<UserChatRooms> _userChatRoomsSubscription;

  UserChatRoomsBloc(
    ChatRoomCardListRepository chatRoomCardListRepository,
  )   : assert(chatRoomCardListRepository != null),
        _chatRoomCardListRepository = chatRoomCardListRepository,
        super(const UserChatRoomsInitial()) {
          print("UserChatRoomSubs lsafdjkaksldfj");
    _userChatRoomsSubscription = _chatRoomCardListRepository.userChatRooms
        .listen((userChatRooms) =>
            add(UserChatRoomsLoadEvent(userChatRooms: userChatRooms)));
  }

  @override
  Future<void> close() {
    _userChatRoomsSubscription?.cancel();
    return super.close();
  }

  @override
  Stream<UserChatRoomsState> mapEventToState(
    UserChatRoomsEvent event,
  ) async* {
    if (event is UserChatRoomsLoadEvent) {
      yield UserChatRoomsLoadedState(userChatRooms: event.userChatRooms);
    }
  }
}
