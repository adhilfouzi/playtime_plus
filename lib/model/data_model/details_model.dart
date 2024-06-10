import 'package:cloud_firestore/cloud_firestore.dart';

class DetailsModel {
  bool isAdmin;

  DetailsModel({required this.isAdmin});

  factory DetailsModel.fromSnapshot(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    return DetailsModel(isAdmin: data['isAdmin'] ?? false);
  }
}
