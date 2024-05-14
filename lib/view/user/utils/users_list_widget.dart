import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view_model/users_list/users_list_bloc.dart';
import 'users_list_item.dart';

class UsersListWidget extends StatelessWidget {
  const UsersListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersListBloc, UsersListState>(
      builder: (context, state) {
        if (state is UsersListLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is UsersListLoaded) {
          final turfList = state.usersList;

          if (turfList.isEmpty) {
            return const Center(
              child: Text("Turfs not available"),
            );
          } else {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<UsersListBloc>().add(FetchTurfList());
              },
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: turfList.length,
                itemBuilder: (context, index) {
                  final turf = turfList[index];
                  return UserListItem(
                    key: ValueKey(turf.id), // Ensure unique key for each item
                    screenWidth: MediaQuery.of(context).size.width,
                    screenHeight: MediaQuery.of(context).size.height,
                    userName: turf.name,
                    userEmail: turf.email,
                    userNumber: turf.number,
                    userProfile: turf.profile,
                    isUser: turf.isUser,
                    model: turf,
                  );
                },
              ),
            );
          }
        } else if (state is UsersListError) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const Center(
            child: Text("Unknown state"),
          ); // Handle other states if needed
        }
      },
    );
  }
}
