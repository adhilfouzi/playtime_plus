import 'package:cloud_firestore/cloud_firestore.dart';

import '../../controller/firebase_exceptionhandler.dart';
import '../../data_model/owner_model.dart';

class TurfRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  List<OwnerModel> turfList = [];

  /// Function to fetch all turf details from Firestore
  Future<List<OwnerModel>> fetchAllTurfDetails() async {
    try {
      QuerySnapshot turfSnapshot = await _db.collection("Owner").get();
      turfList.clear();
      for (var doc in turfSnapshot.docs) {
        Map<String, dynamic> turfData = doc.data() as Map<String, dynamic>;
        turfList.add(OwnerModel.fromJson(turfData));
      }

      return turfList;
    } catch (e) {
      throw ExceptionHandler.handleException(e);
    }
  }

  /// Function to fetch turf details from Firestore
  Future<OwnerModel> fetchTurfDetails(String id) async {
    try {
      DocumentSnapshot snapshot = await _db.collection("Owner").doc(id).get();
      if (snapshot.exists) {
        return OwnerModel.fromSnapshot(snapshot);
      } else {
        return OwnerModel.emptyOwnerModel();
      }
    } catch (e) {
      throw ExceptionHandler.handleException(e);
    }
  }
}
