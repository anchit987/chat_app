import 'package:chat_app/domain/entities/user_info_card_search.dart';

abstract class SearchRepository {
  Future<List<UserInfoCardSearch>> get getUsers;
}
