part of 'request_turflist_bloc.dart';

@immutable
sealed class RequestTurflistState {}

final class RequestTurflistInitial extends RequestTurflistState {}
// Define the states for the TurfBloc

class RequestTurflistLoading extends RequestTurflistState {}

class RequestTurflistSearching extends RequestTurflistState {}

class RequestTurflistLoaded extends RequestTurflistState {
  final List<OwnerModel> requestTurflist;

  RequestTurflistLoaded(this.requestTurflist);
}

class RequestTurflistError extends RequestTurflistState {
  final String message;

  RequestTurflistError(this.message);
}
