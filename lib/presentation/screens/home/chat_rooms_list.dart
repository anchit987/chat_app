import 'package:chat_app/domain/entities/chat_rooms_entities/user_chat_rooms.dart';
import 'package:chat_app/presentation/blocs_and_cubits/user_chat_rooms/user_chat_rooms_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatRoomsList extends StatefulWidget {
  @override
  _ChatRoomsListState createState() => _ChatRoomsListState();
}

class _ChatRoomsListState extends State<ChatRoomsList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserChatRoomsBloc, UserChatRoomsState>(
      builder: (context, state) {
        if (state is UserChatRoomsLoadedState) {
          final chatRoomCardInfoList = state.userChatRooms.chatRoomCardInfoList;
          return ListView.builder(
            itemCount: chatRoomCardInfoList.length,
            itemBuilder: (context, index) {
              final chatRoomName = chatRoomCardInfoList[index].chatRoomName;
              return ListTile(
                title: Text(chatRoomName),
              );
            },
          );
        }
        return Container();
      },
    );
  }
}
