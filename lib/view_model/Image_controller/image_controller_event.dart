part of 'image_controller_bloc.dart';

@immutable
sealed class ImageControllerEvent {}

class FetchPosterList extends ImageControllerEvent {}

class PickImageEvent extends ImageControllerEvent {
  // final ImageSource source;

  // PickImageEvent(this.source);

  // List<Object?> get props => [source];
}

class CompressImageEvent extends ImageControllerEvent {
  final File file;

  CompressImageEvent(this.file);

  List<Object?> get props => [file];
}

class FetchImageEvent extends ImageControllerEvent {
  final List<String> fileList;

  FetchImageEvent(this.fileList);

  List<Object?> get props => [fileList];
}

class UploadTurfImageEvent extends ImageControllerEvent {
  final File file;

  UploadTurfImageEvent(this.file);

  List<Object?> get props => [file];
}

class DeleteTurfImageEvent extends ImageControllerEvent {
  final int index;

  DeleteTurfImageEvent(this.index);

  List<Object?> get props => [index];
}
