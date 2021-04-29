import 'package:chat_app/di/get_it.dart';
import 'package:chat_app/presentation/blocs_and_cubits/search/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchBloc searchBloc;
  @override
  void initState() {
    searchBloc = getItInstance<SearchBloc>();
    searchBloc.add(GetUsersEvent());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    searchBloc?.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => searchBloc,
        child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            if (state is UsersLoaded) {
              print("anchit");
              print(state.users);
              return ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  final user = state.users[index];
                  print(user.username);
                  return ListTile(
                    title: Text(user.username),
                  );
                },
              );
            } else if (state is SearchInitial)
              return Center(child: CircularProgressIndicator());
            return Container();
          },
        ),
      ),
    );
  }
}
