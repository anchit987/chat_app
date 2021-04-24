import 'package:equatable/equatable.dart';

class UserUid extends Equatable {
  final String uid;

  const UserUid(this.uid);

  @override
  List<Object> get props => [uid];
}
