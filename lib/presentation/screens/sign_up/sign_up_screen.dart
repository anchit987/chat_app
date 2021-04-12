import 'package:chat_app/di/get_it.dart';
import 'package:chat_app/presentation/blocs_and_cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:chat_app/presentation/screens/sign_up/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => getItInstance<SignUpCubit>(),
        child: SignUpForm(),
      ),
    );
  }
}
