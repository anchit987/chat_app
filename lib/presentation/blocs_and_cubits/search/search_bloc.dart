import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:chat_app/domain/entities/user_info_card_search.dart';
import 'package:chat_app/domain/repositories/search_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository _searchRepository;
  SearchBloc(
    this._searchRepository,
  ) : super(SearchInitial());

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is GetUsersEvent) {
      final users = await _searchRepository.getUsers;
      yield UsersLoaded(users);
    }
  }
}
