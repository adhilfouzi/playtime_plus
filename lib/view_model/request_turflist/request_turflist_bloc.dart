import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/backend/repositories/turf_repositories.dart';
import '../../model/data_model/owner_model.dart';

part 'request_turflist_event.dart';
part 'request_turflist_state.dart';

class RequestTurflistBloc
    extends Bloc<RequestTurflistEvent, RequestTurflistState> {
  RequestTurflistBloc() : super(RequestTurflistInitial()) {
    on<RequesFetchTurfId>(_onRequesFetchTurfId);
  }
  void _onRequesFetchTurfId(RequesFetchTurfId event, emit) async {
    emit(RequestTurflistLoading());
    try {
      // log(event.model.courtName);
      var turfList = await TurfRepository().requestedAllTurfDetails();

      emit(RequestTurflistLoaded(turfList));
    } catch (e) {
      emit(RequestTurflistError('Failed to fetch turf details: $e'));
    }
  }
}
