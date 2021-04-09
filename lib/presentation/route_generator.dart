import 'dart:ffi';

import 'package:chat_app/common/constants/route_constants.dart';
import 'package:chat_app/presentation/app_view.dart';
import 'package:chat_app/presentation/screens/home/home_screen.dart';
import 'package:chat_app/presentation/screens/sign_in/sign_in_screen.dart';
import 'package:chat_app/presentation/screens/sign_up/sign_up_screen.dart';
import 'package:chat_app/presentation/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    switch (settings.name) {
      case RouteList.initial:
        return MaterialPageRoute(builder: (_) => AppView());
      case RouteList.splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case RouteList.signIn:
        return MaterialPageRoute(builder: (_) => SignInScreen());
      case RouteList.signUp:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case RouteList.home:
        return MaterialPageRoute(builder: (_) => HomeScreen(user: args));
    }
  }
}
