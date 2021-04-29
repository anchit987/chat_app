import 'package:chat_app/data/repositories/search_repository_impl.dart';
import 'package:chat_app/data/repositories/user_repository_impl.dart';
import 'package:chat_app/domain/repositories/search_repository.dart';
import 'package:chat_app/domain/repositories/user_repository.dart';
import 'package:chat_app/presentation/blocs_and_cubits/search/search_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../data/data_sources/firestore_data_sources.dart';
import '../data/repositories/chat_room_card_list_repo_impl.dart';
import '../data/repositories/firebase_auth_impl.dart';
import '../domain/repositories/auth_repository.dart';
import '../domain/repositories/chat_room_card_list_repository.dart';
import '../domain/usecases/auth/sign_in_user.dart';
import '../domain/usecases/auth/sign_up_user.dart';
import '../presentation/blocs_and_cubits/auth_bloc/authentication_bloc.dart';
import '../presentation/blocs_and_cubits/sign_in_cubit/sign_in_cubit.dart';
import '../presentation/blocs_and_cubits/sign_up_cubit/sign_up_cubit.dart';
import '../presentation/blocs_and_cubits/user_chat_rooms/user_chat_rooms_bloc.dart';

final getItInstance = GetIt.I;

Future intit() async {
  getItInstance
      .registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getItInstance.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance);

  //? REPOSITORY
  getItInstance.registerLazySingleton<AuthRepository>(
      () => FirebaseAuthImpl(getItInstance(), getItInstance()));
  getItInstance.registerLazySingleton<ChatRoomCardListRepository>(
      () => ChatRoomCardListRepositoryImpl(getItInstance(), getItInstance()));
  getItInstance.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(getItInstance(), getItInstance()));
  getItInstance.registerLazySingleton<SearchRepository>(
      () => SearchRepositoryImpl(getItInstance(), getItInstance()));

  //? DATASOURCES
  getItInstance.registerLazySingleton<FirestoreDataSources>(
      () => FirestoreDataSourcesImpl(getItInstance()));

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

  getItInstance.registerFactory<UserChatRoomsBloc>(
      () => UserChatRoomsBloc(getItInstance()));

  getItInstance.registerFactory<SearchBloc>(() => SearchBloc(getItInstance()));
}
