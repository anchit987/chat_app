import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_app/domain/entities/chat_rooms_entities/chat_room_entity.dart';
import 'package:chat_app/domain/entities/chat_rooms_entities/chat_room_card_list_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'chats_event.dart';
part 'chats_state.dart';

class ChatsBloc extends Bloc<ChatsEvent, ChatsState> {
  ChatsBloc() : super(ChatsInitial());

  @override
  Stream<ChatsState> mapEventToState(
    ChatsEvent event,
  ) async* {
    if (event is ChatsLoadEvent) {
      
    }
  }
}
