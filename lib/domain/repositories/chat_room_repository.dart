import 'package:chat_app/domain/entities/errors/app_error.dart';
import 'package:chat_app/domain/entities/message_entity.dart';
import 'package:chat_app/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ChatRoomRepository {
  String get chatRoomName;

  Future<Either<AppError, List<Message>>> getAllMessages();

  //TODO: different User entity
  Future<Either<AppError, List<User>>> getAllUsers();

  //TODO: Admins entity
  Future<Either<AppError, String>> getAllAdmins();

  //TODO: Room Informations
  Future<Either<AppError, String>> getRoomInformation();
}
