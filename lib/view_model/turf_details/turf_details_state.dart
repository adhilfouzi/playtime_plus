part of 'turf_details_bloc.dart';

@immutable
sealed class TurfDetailsState {}

final class TurfDetailsInitial extends TurfDetailsState {}
// Define the states for the TurfBloc

class TurfDetailsLoading extends TurfDetailsState {}

class TurfDetailsSearching extends TurfDetailsState {}

class TurfDetailsLoaded extends TurfDetailsState {
  final OwnerModel turfDetails;

  TurfDetailsLoaded(this.turfDetails);
}

class TurfDetailsError extends TurfDetailsState {
  final String message;

  TurfDetailsError(this.message);
}
