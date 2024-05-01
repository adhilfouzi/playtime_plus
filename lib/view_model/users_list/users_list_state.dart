part of 'users_list_bloc.dart';

@immutable
sealed class UsersListState {}

final class UsersListInitial extends UsersListState {}

class UsersListLoading extends UsersListState {}

class UsersListSearching extends UsersListState {}

class UsersListLoaded extends UsersListState {
  final List<UserModel> usersList;

  UsersListLoaded(this.usersList);
}

class UsersListError extends UsersListState {
  final String message;

  UsersListError(this.message);
}
