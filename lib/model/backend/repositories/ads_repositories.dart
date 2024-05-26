import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../controller/firebase_exceptionhandler.dart';
import '../../data_model/ads_model.dart';

class AdsRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Save ad data to Firestore
  Future<void> saveAds(AdsModel ads) async {
    try {
      await _db.collection("Admin").doc('Ads').set(ads.toJson());
      log("Ads count: ${ads.poster.length}");
    } catch (e) {
      throw ExceptionHandler.handleException(e);
    }
  }

  /// Fetch ads list from Firestore
  Future<AdsModel> fetchAdsList() async {
    try {
      var adsShot = await _db.collection("Admin").doc("Ads").get();
      if (adsShot.exists) {
        return AdsModel.fromJson(adsShot.data()!);
      } else {
        return AdsModel.emptyAdsModel();
      }
    } catch (e) {
      throw ExceptionHandler.handleException(e);
    }
  }

  /// Delete an ad from Firestore
  Future<void> deleteAd(int adIndex) async {
    try {
      var adsShot = await _db.collection("Admin").doc("Ads").get();
      if (adsShot.exists) {
        AdsModel adsList = AdsModel.fromJson(adsShot.data()!);

        // Remove the ad at the specified index
        adsList.poster.removeAt(adIndex);
        await _db.collection("Admin").doc('Ads').update(adsList.toJson());
      } else {
        throw Exception("Ads not found.");
      }
    } catch (e) {
      throw ExceptionHandler.handleException(e);
    }
  }

  /// Update an ad in Firestore
  Future<void> updateAd(int adIndex, String updatedAd) async {
    try {
      var adsShot = await _db.collection("Admin").doc("Ads").get();
      if (adsShot.exists) {
        AdsModel adsList = AdsModel.fromJson(adsShot.data()!);
        // Update the ad at the specified index
        adsList.poster[adIndex] = updatedAd;
        await _db.collection("Admin").doc('Ads').update(adsList.toJson());
      } else {
        throw Exception("Ads not found.");
      }
    } catch (e) {
      throw ExceptionHandler.handleException(e);
    }
  }

  /// Add a new ad to Firestore
  Future<void> addAd(String newAd) async {
    try {
      var adsShot = await _db.collection("Admin").doc("Ads").get();
      late AdsModel adsList;
      if (adsShot.exists) {
        adsList = AdsModel.fromJson(adsShot.data()!);
        adsList.poster.add(newAd);
      } else {
        adsList = AdsModel(poster: [newAd]);
      }
      await _db.collection("Admin").doc('Ads').set(adsList.toJson());
      log("poster added in the list");
    } catch (e) {
      log("addAd: $e");
      throw ExceptionHandler.handleException(e);
    }
  }

  Future<String> uploadImages(File file) async {
    try {
      final fileName = file.path.split("/").last;
      final time = DateTime.now().millisecondsSinceEpoch;
      log("Uploading file: $fileName at $time");

      // Create a reference to the location you want to upload to in Firebase Storage
      Reference reference =
          FirebaseStorage.instance.ref().child('Ad_poster/$time-$fileName');
      log("Reference created: ${reference.fullPath}");

      // Upload the file to Firebase Storage
      UploadTask uploadTask = reference.putFile(file);
      log("Upload task created");

      // Wait for the upload to complete with a timeout
      TaskSnapshot taskSnapshot = await uploadTask.timeout(
        Duration(seconds: 30),
        onTimeout: () {
          log('Upload timed out');
          throw TimeoutException('The upload has timed out');
        },
      );

      log("Upload completed: ${taskSnapshot.bytesTransferred} bytes transferred");

      // Get the download URL
      String imageUrl = await taskSnapshot.ref.getDownloadURL().timeout(
        const Duration(seconds: 45),
        onTimeout: () {
          log('Get download URL timed out');
          throw TimeoutException('Getting the download URL has timed out');
        },
      );

      log("Image uploaded successfully: $imageUrl");
      return imageUrl;
    } catch (e) {
      log('Failed to upload image to Firebase Storage: $e');
      throw Exception('Failed to upload image to Firebase Storage: $e');
    }
  }
}
