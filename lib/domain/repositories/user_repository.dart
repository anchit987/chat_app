import '../entities/user_entity.dart';

abstract class UserRepository {
  Stream<User> get user;
}
