import 'package:chat_app/common/constants/route_constants.dart';
import 'package:chat_app/presentation/blocs_and_cubits/auth_bloc/authentication_bloc.dart';
import 'package:chat_app/presentation/screens/splash/splash_screen.dart';
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
            Navigator.of(context).pushNamedAndRemoveUntil(
                RouteList.home, (route) => false,
                arguments: state.user);
            break;

          case AuthenticationStatus.unauthenticated:
            Navigator.of(context)
                .pushNamedAndRemoveUntil(RouteList.signIn, (route) => false);
            break;

          default:
            break;
        }
      },
      child: Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}
