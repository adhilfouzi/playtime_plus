import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import '../../model/backend/repositories/ads_repositories.dart';

part 'image_controller_event.dart';
part 'image_controller_state.dart';

class ImageBloc extends Bloc<ImageControllerEvent, ImageControllerState> {
  ImageBloc() : super(ImageInitial()) {
    on<FetchPosterList>(_onFetchPosterList);
    on<PickImageEvent>(_onPickImage);
    on<CompressImageEvent>(_onCompressImage);
    on<UploadTurfImageEvent>(_onUploadPoster);
    on<DeleteTurfImageEvent>(_onDeleteTurfImage);
  }

  Future<void> _onFetchPosterList(
    FetchPosterList event,
    Emitter<ImageControllerState> emit,
  ) async {
    emit(ImageLoading());
    log('Loading...');
    try {
      log('Fetching poster list');
      var ads = await AdsRepository().fetchAdsList();
      log('Fetched poster list');
      emit(PosterImages(ads.poster));
    } catch (e) {
      log("ImagesFetchError: $e");
      emit(ImagesFetchError("ImagesFetchError: $e"));
    }
  }

  Future<void> _onPickImage(
    PickImageEvent event,
    Emitter<ImageControllerState> emit,
  ) async {
    try {
      final XFile? image =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        emit(ImageInitial());
        return;
      }

      var imageFile = File(image.path);
      log('Original file size: ${imageFile.lengthSync()} bytes');
      add(CompressImageEvent(imageFile));
    } catch (e) {
      log('Failed to pick image: $e');
      emit(ImageUploadFailure('Failed to pick image'));
    }
  }

  Future<void> _onCompressImage(
    CompressImageEvent event,
    Emitter<ImageControllerState> emit,
  ) async {
    try {
      Directory tempDir = await getTemporaryDirectory();
      String targetPath = path.join(
          tempDir.path, 'compressed_${path.basename(event.file.path)}');
      final XFile? compressedXFile =
          await FlutterImageCompress.compressAndGetFile(
        event.file.absolute.path,
        targetPath,
        quality: 20,
      );

      if (compressedXFile == null) {
        throw Exception("Compression failed.");
      }

      var compressedFile = File(compressedXFile.path);
      log('Compressed file size: ${compressedFile.lengthSync()} bytes');
      log('Compressed file: ${compressedFile.path}');

      var posterFile = await AdsRepository().uploadImages(compressedFile);
      log('Image uploaded to storage: $posterFile');

      log('Starting image upload');
      await AdsRepository().addAd(posterFile);

      log('Fetching poster list');
      add(FetchPosterList());

      log('Emitting ImageUploadSuccess state');
      emit(ImageUploadSuccess());
    } catch (e) {
      log("Compression error: $e");
      emit(ImageUploadFailure('Image compression failed'));
    }
  }

  Future<void> _onUploadPoster(
    UploadTurfImageEvent event,
    Emitter<ImageControllerState> emit,
  ) async {
    log('UploadTurfImageEvent triggered');
    try {
      var posterFile = await AdsRepository().uploadImages(event.file);

      log('Adding ad');
      await AdsRepository().addAd(posterFile);

      log('Emitting ImageLoading state');
      emit(ImageLoading());

      log('Fetching poster list');
      add(FetchPosterList());

      log('Emitting ImageUploadSuccess state');
      emit(ImageUploadSuccess());
    } catch (e) {
      log('Error uploading profile image: $e');
      emit(ImageUploadFailure('Failed to upload profile image'));
    }
  }

  Future<void> _onDeleteTurfImage(
    DeleteTurfImageEvent event,
    Emitter<ImageControllerState> emit,
  ) async {
    try {
      var ads = await AdsRepository().fetchAdsList();
      ads.poster.removeAt(event.index);
      await AdsRepository().saveAds(ads);
      add(FetchPosterList());
      emit(TurfImageDeleted());
    } catch (e) {
      log('Error deleting turf images: $e');
      emit(ImageUploadFailure('Failed to delete turf images'));
    }
  }
}
