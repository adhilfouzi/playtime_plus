import 'package:admin_side_turf_application/model/data_model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/backend/repositories/turf_repositories.dart';

part 'users_list_event.dart';
part 'users_list_state.dart';

class UsersListBloc extends Bloc<UsersListEvent, UsersListState> {
  UsersListBloc() : super(UsersListInitial()) {
    on<FetchTurfList>(_onFetchTurfList);
  }
  void _onFetchTurfList(FetchTurfList event, emit) async {
    emit(UsersListLoading());
    try {
      // log(event.model.courtName);
      var turf = await TurfRepository().fetchAllUsersDetails();

      emit(UsersListLoaded(turf));
    } catch (e) {
      emit(UsersListError('Failed to fetch turf details: $e'));
    }
  }
}
