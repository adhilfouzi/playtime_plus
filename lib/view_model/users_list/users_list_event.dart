part of 'users_list_bloc.dart';

@immutable
sealed class UsersListEvent {}

class FetchTurfList extends UsersListEvent {}
