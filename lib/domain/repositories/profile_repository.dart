import 'package:chat_app/domain/entities/errors/app_error.dart';
import 'package:chat_app/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  Future<Either<AppError, Unit>> changeUsername(String newUsername);

  Future<Either<AppError, Unit>> changePhoto(String newPhoto);

  Future<Either<AppError, Unit>> changeStatus(String newStatus);

  Future<Either<AppError, User>> getProfileInformations();

  // Future<Either<AppError, List<String>>> getAllFriends();

  // Future<Either<AppError, List<String>>> getAllFriendRequests();

  // Future<Either<AppError, List<String>>> getAllSentFriendRequests();

  // Future<Either<AppError, ChatRooms>> getAllChatRooms();
}
