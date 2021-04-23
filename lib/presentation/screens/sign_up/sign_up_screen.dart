import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di/get_it.dart';
import '../../blocs_and_cubits/sign_up_cubit/sign_up_cubit.dart';
import 'sign_up_form.dart';

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
