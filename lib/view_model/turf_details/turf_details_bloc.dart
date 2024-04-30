import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/data_model/owner_model.dart';

part 'turf_details_event.dart';
part 'turf_details_state.dart';

class TurfDetailsBloc extends Bloc<TurfDetailsEvent, TurfDetailsState> {
  TurfDetailsBloc() : super(TurfDetailsInitial()) {
    on<FetchTurfId>(onFetchTurfId);
  }
  void onFetchTurfId(FetchTurfId event, emit) async {
    emit(TurfDetailsLoading());
    try {
      // log(event.model.courtName);

      emit(TurfDetailsLoaded(event.model));
    } catch (e) {
      emit(TurfDetailsError('Failed to fetch turf details: $e'));
    }
  }
}
