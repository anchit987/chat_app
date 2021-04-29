import 'package:equatable/equatable.dart';

class UserInfoCardSearch extends Equatable {
  final String uid;
  final String username;
  final String photo;
  final String status;

  const UserInfoCardSearch({
    this.uid,
    this.username,
    this.photo,
    this.status,
  });

  @override
  List<Object> get props => [uid, username, photo, status];
}
