import 'package:chat_app/data/data_sources/firestore_data_sources.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../data/repositories/firebase_auth_impl.dart';
import '../domain/repositories/auth_repository.dart';
import '../domain/usecases/auth/sign_in_user.dart';
import '../domain/usecases/auth/sign_up_user.dart';
import '../presentation/blocs_and_cubits/auth_bloc/authentication_bloc.dart';
import '../presentation/blocs_and_cubits/sign_in_cubit/sign_in_cubit.dart';
import '../presentation/blocs_and_cubits/sign_up_cubit/sign_up_cubit.dart';

final getItInstance = GetIt.I;

Future intit() async {
  getItInstance
      .registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  getItInstance.registerLazySingleton<AuthRepository>(
      () => FirebaseAuthImpl(getItInstance(), getItInstance()));

  //? DATASOURCES
  getItInstance.registerLazySingleton<FirestoreDataSources>(
      () => FirestoreDataSourcesImpl());

  //? USECASES
  getItInstance
      .registerLazySingleton<SignInUser>(() => SignInUser(getItInstance()));
  getItInstance
      .registerLazySingleton<SignUpUser>(() => SignUpUser(getItInstance()));
  //? BLOCS
  getItInstance.registerFactory<AuthenticationBloc>(
      () => AuthenticationBloc(getItInstance()));

  getItInstance
      .registerFactory<SignUpCubit>(() => SignUpCubit(getItInstance()));

  getItInstance
      .registerFactory<SignInCubit>(() => SignInCubit(getItInstance()));
}
