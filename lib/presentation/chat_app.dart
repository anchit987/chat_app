import 'package:chat_app/common/constants/route_constants.dart';
import 'package:chat_app/common/screen_util/screen_util.dart';
import 'package:chat_app/data/repositories/firebase_auth_impl.dart';
import 'package:chat_app/di/get_it.dart';
import 'package:chat_app/presentation/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_app/presentation/blocs_and_cubits/auth_bloc/authentication_bloc.dart';

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
