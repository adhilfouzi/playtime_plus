import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/backend/repositories/turf_repositories.dart';
import '../../model/data_model/owner_model.dart';

part 'turf_details_event.dart';
part 'turf_details_state.dart';

class TurfDetailsBloc extends Bloc<TurfDetailsEvent, TurfDetailsState> {
  TurfDetailsBloc() : super(TurfDetailsInitial()) {
    on<FetchTurfId>(_onFetchTurfId);
  }
  void _onFetchTurfId(FetchTurfId event, emit) async {
    emit(TurfDetailsLoading());
    try {
      // log(event.model.courtName);
      var turf = await TurfRepository().fetchTurfDetails(event.id);

      emit(TurfDetailsLoaded(turf));
    } catch (e) {
      emit(TurfDetailsError('Failed to fetch turf details: $e'));
    }
  }
}
