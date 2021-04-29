part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class UsersLoaded extends SearchState {
  final List<UserInfoCardSearch> users;

  const UsersLoaded(this.users);

  @override
  List<Object> get props => [users];
}
