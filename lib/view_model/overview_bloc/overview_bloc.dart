import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/backend/repositories/overview_repositories.dart';
import '../../model/data_model/overview_model.dart';

part 'overview_event.dart';
part 'overview_state.dart';

class OverviewBloc extends Bloc<OverviewEvent, OverviewState> {
  OverviewBloc() : super(OverviewInitial()) {
    on<OverviewEvent>((event, emit) async {
      if (event is OverViewData) {
        emit(OverviewLoading());
        try {
          final data = await OverView().overViewStatus();
          log("total User: ${data.totalUser}");
          log("total Owner: ${data.totalOwner}");
          log("total bookings: ${data.bookings.length}");
          log("total payment: ${data.payment.length}");
          emit(OverviewLoaded(data));
        } catch (e) {
          emit(OverviewError(e.toString()));
          log(e.toString());
        }
      }
    });
  }
}
