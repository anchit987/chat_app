import 'package:chat_app/di/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/constants/route_constants.dart';
import '../../blocs_and_cubits/auth_bloc/authentication_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthenticationBloc authenticationBloc;

  @override
  void initState() {
    super.initState();
    authenticationBloc = getItInstance<AuthenticationBloc>();
  }

  @override
  void dispose() {
    super.dispose();
    authenticationBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        switch (state.status) {
          case AuthenticationStatus.unauthenticated:
            print("COMe here kasdjflajf");
            Navigator.of(context)
                .pushNamedAndRemoveUntil(RouteList.signIn, (route) => false);
            break;
          default:
            break;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Chat App"),
          actions: [
            IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () {
                  authenticationBloc.add(AuthenticationLogoutRequest());
                })
          ],
        ),
        body: Center(
          child: Text("user signed in"),
        ),
      ),
    );
  }
}
