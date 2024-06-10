import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../controller/firebase_exceptionhandler.dart';
import '../../data_model/details_model.dart';

class AuthenticationRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  User? get authUser => _auth.currentUser;

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    try {
      log('before sign methode');
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      log('after sign methode');

      DocumentSnapshot snapshot =
          await _db.collection("Admin").doc(userCredential.user!.uid).get();

      DetailsModel details = DetailsModel.fromSnapshot(snapshot);
      return details.isAdmin;
    } catch (e) {
      log(ExceptionHandler.handleException(e));
      return false;
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw ExceptionHandler.handleException(e);
    }
  }

  Future<void> userLogout() async {
    try {
      if (authUser != null) {
        log(authUser!.uid.toString());
        await _auth.signOut();
      } else {
        log('message');
      }
    } catch (e) {
      throw ExceptionHandler.handleException(e);
    }
  }
}
