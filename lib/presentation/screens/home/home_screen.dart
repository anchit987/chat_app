import 'package:chat_app/presentation/blocs_and_cubits/user_chat_rooms/user_chat_rooms_bloc.dart';
import 'package:chat_app/presentation/screens/home/chat_rooms_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/constants/route_constants.dart';
import '../../../di/get_it.dart';
import '../../blocs_and_cubits/auth_bloc/authentication_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthenticationBloc authenticationBloc;
  UserChatRoomsBloc userChatRoomsBloc;

  @override
  void initState() {
    super.initState();
    authenticationBloc = getItInstance<AuthenticationBloc>();
    userChatRoomsBloc = getItInstance<UserChatRoomsBloc>();
  }

  @override
  void dispose() {
    super.dispose();
    authenticationBloc?.close();
    userChatRoomsBloc?.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        switch (state.status) {
          case AuthenticationStatus.unauthenticated:
            Navigator.of(context)
                .pushNamedAndRemoveUntil(RouteList.signIn, (route) => false);
            break;
          default:
            break;
        }
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => userChatRoomsBloc),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: Text("Chat App"),
            actions: [
              IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () {
                  authenticationBloc.add(AuthenticationLogoutRequest());
                },
              ),
            ],
          ),
          body: ChatRoomsList(),
        ),
      ),
    );
  }
}
