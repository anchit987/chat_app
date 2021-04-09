import 'package:chat_app/data/repositories/firebase_auth_impl.dart';
import 'package:chat_app/domain/repositories/auth_repository.dart';
import 'package:chat_app/presentation/blocs_and_cubits/auth_bloc/authentication_bloc.dart';
import 'package:chat_app/presentation/blocs_and_cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:chat_app/presentation/blocs_and_cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final getItInstance = GetIt.I;

Future intit() async {
  getItInstance
      .registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  getItInstance.registerLazySingleton<AuthRepository>(
      () => FirebaseAuthImpl(getItInstance()));

  getItInstance.registerFactory<AuthenticationBloc>(
      () => AuthenticationBloc(getItInstance()));

  getItInstance
      .registerFactory<SignUpCubit>(() => SignUpCubit(getItInstance()));

  getItInstance
      .registerFactory<SignInCubit>(() => SignInCubit(getItInstance()));
}
