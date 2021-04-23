
import 'package:flutter/material.dart';

import '../common/constants/route_constants.dart';
import 'app_view.dart';
import 'screens/home/home_screen.dart';
import 'screens/sign_in/sign_in_screen.dart';
import 'screens/sign_up/sign_up_screen.dart';
import 'screens/splash/splash_screen.dart';

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
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }
  }
}
