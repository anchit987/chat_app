import 'package:chat_app/data/models/user_info_card_search_model.dart';
import 'package:chat_app/domain/repositories/search_repository.dart';
import 'package:chat_app/domain/repositories/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchRepositoryImpl extends SearchRepository {
  final UserRepository _userRepository;
  final FirebaseFirestore _firestore;
  SearchRepositoryImpl(this._firestore, this._userRepository);

  @override
  Future<List<UserInfoCardSearchModel>> get getUsers async {
    final docs = await _firestore.collection("search").doc("all-users").get();

    final data = docs.data();

    final myList = (data["all-users"] as List)
        .map((e) => UserInfoCardSearchModel.fromMap(e))
        .toList();
    print(myList);
    return myList;
  }
}
