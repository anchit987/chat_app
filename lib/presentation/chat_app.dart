import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../common/constants/route_constants.dart';
import '../common/screen_util/screen_util.dart';
import '../di/get_it.dart';
import 'blocs_and_cubits/auth_bloc/authentication_bloc.dart';
import 'route_generator.dart';

class ChatApp extends StatefulWidget {
  @override
  _ChatAppState createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
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
    ScreenUtil.init();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => authenticationBloc,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chat App',
        theme: ThemeData(
          primaryColor: Colors.blue,
          accentColor: Colors.cyan,
          scaffoldBackgroundColor: Colors.blue.shade200,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: RouteList.initial,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
