import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di/get_it.dart';
import '../../blocs_and_cubits/sign_in_cubit/sign_in_cubit.dart';
import 'sign_in_form.dart';

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
