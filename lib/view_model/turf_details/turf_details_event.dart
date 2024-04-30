part of 'turf_details_bloc.dart';

@immutable
sealed class TurfDetailsEvent {}

class FetchTurfId extends TurfDetailsEvent {
  final OwnerModel model;
  FetchTurfId(this.model);
}
