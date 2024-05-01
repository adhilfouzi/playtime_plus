import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../controller/firebase_exceptionhandler.dart';

class TurfAuthentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Send a password reset email to the user
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      // Handle errors
      log('Error sending password reset email: $e');
      throw ExceptionHandler.handleException(e);
    }
  }

  // Change all collection data for the owner associated with the user
  Future<void> changeOwnerCollections(
      String ownerId, Map<String, dynamic> newData) async {
    try {
      await _db.collection('Owner').doc(ownerId).update(newData);
    } catch (e) {
      // Handle errors
      log('Error updating owner collections: $e');
      throw ExceptionHandler.handleException(e);
    }
  }

  /// Update a isOwner field in a user's collection
  Future<void> ownerAccountStatus(
      {required String ownerId, required bool value}) async {
    try {
      bool val = value ? false : true;
      await _db.collection("Owner").doc(ownerId).update({
        "isOwner": val,
      });
    } catch (e) {
      throw ExceptionHandler.handleException(e);
    }
  }

  /// Update a isOwner field in a user's collection
  Future<void> userAccountStatus(
      {required String ownerId, required bool value}) async {
    try {
      bool val = value ? false : true;
      await _db.collection("Users").doc(ownerId).update({
        "isUser": val,
      });
    } catch (e) {
      throw ExceptionHandler.handleException(e);
    }
  }
}
