import 'package:chat_app/domain/entities/user_info_card_search.dart';

class UserInfoCardSearchModel extends UserInfoCardSearch {
  final String uid;
  final String username;
  final String photo;
  final String status;

  const UserInfoCardSearchModel({
    this.uid,
    this.username,
    this.photo,
    this.status,
  }) : super(
          uid: uid,
          username: username,
          photo: photo,
          status: status,
        );

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'username': username,
      'photo': photo,
      'status': status,
    };
  }

  factory UserInfoCardSearchModel.fromMap(Map<String, dynamic> map) {
    return UserInfoCardSearchModel(
      uid: map['uid'],
      username: map['username'],
      photo: map['photo'],
      status: map['status'],
    );
  }
}
