part of 'image_controller_bloc.dart';

@immutable
sealed class ImageControllerState {}

final class ImageControllerInitial extends ImageControllerState {}

class ImageInitial extends ImageControllerState {}

class ImageLoading extends ImageControllerState {}

class ImagePicked extends ImageControllerState {
  final File image;

  ImagePicked(this.image);

  List<Object?> get props => [image];
}

class ImageCompressed extends ImageControllerState {
  final File image;

  ImageCompressed(this.image);

  List<Object?> get props => [image];
}

class ImageUploadSuccess extends ImageControllerState {}

class ImageUploadFailure extends ImageControllerState {
  final String error;

  ImageUploadFailure(this.error);

  List<Object?> get props => [error];
}

class TurfImageDeleted extends ImageControllerState {}

class PosterImages extends ImageControllerState {
  final List<String> images;

  PosterImages(this.images);

  List<Object?> get props => [images];
}

class ImagesFetchError extends ImageControllerState {
  final String error;

  ImagesFetchError(this.error);

  List<Object?> get props => [error];
}
