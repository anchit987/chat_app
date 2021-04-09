import 'package:chat_app/common/constants/route_constants.dart';
import 'package:chat_app/presentation/blocs_and_cubits/auth_bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppView extends StatefulWidget {
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        switch (state.status) {
          case AuthenticationStatus.authenticated:
            Navigator.of(context)
                .pushNamed(RouteList.home, arguments: state.user);
            break;

          case AuthenticationStatus.unauthenticated:
            Navigator.of(context).pushNamed(RouteList.signIn);
            break;

          case AuthenticationStatus.unknown:
            Navigator.of(context).pushNamed(RouteList.splash);
            break;
        }
      },
      child: Scaffold(
        body: Container(),
      ),
    );
  }
}
