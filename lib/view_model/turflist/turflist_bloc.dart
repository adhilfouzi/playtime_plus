import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/data_model/owner_model.dart';
import '../../model/backend/repositories/turf_repositories.dart';

part 'turflist_event.dart';
part 'turflist_state.dart';

class TurflistBloc extends Bloc<TurflistEvent, TurflistState> {
  TurflistBloc() : super(TurfInitial()) {
    on<FetchTurfList>(onFetchTurfList);
    // on<SearchTurf>(onSearchTurf);
  }
  void onFetchTurfList(event, emit) async {
    emit(TurfLoading());
    try {
      var turfList = await TurfRepository().fetchAllTurfDetails();
      emit(TurfLoaded(turfList));
    } catch (e) {
      emit(TurfError('Failed to fetch turf list: $e'));
    }
  }
}
