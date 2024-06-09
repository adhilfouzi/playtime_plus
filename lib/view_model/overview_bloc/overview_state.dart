part of 'overview_bloc.dart';

@immutable
sealed class OverviewState {}

final class OverviewInitial extends OverviewState {}

final class OverviewLoading extends OverviewState {}

final class OverviewLoaded extends OverviewState {
  final OverViewModel overViewModel;

  OverviewLoaded(this.overViewModel);
}

final class OverviewError extends OverviewState {
  final String errorMessage;

  OverviewError(this.errorMessage);
}
