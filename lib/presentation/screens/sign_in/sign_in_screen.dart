import 'package:chat_app/di/get_it.dart';
import 'package:chat_app/presentation/blocs_and_cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:chat_app/presentation/screens/sign_in/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (_) => getItInstance<SignInCubit>(),
        child: SignInForm(),
      ),
    );
  }
}
