import 'package:cloud_firestore/cloud_firestore.dart';

import '../controller/formater.dart';

class OwnerModel {
  String id;
  String courtName;
  String courtPhoneNumber;
  String courtEmailAddress;
  String courtDescription;
  String openingTime;
  String closingTime;
  String courtLocation;
  String images;
  String ownerPhoto;
  String ownerFullName;
  String ownerPhoneNumber;
  String ownerEmailAddress;
  bool isOwner;
  bool isRegistered;

  OwnerModel({
    required this.id,
    required this.courtName,
    required this.courtPhoneNumber,
    required this.courtEmailAddress,
    required this.courtDescription,
    required this.openingTime,
    required this.closingTime,
    required this.courtLocation,
    required this.images,
    required this.ownerPhoto,
    required this.ownerFullName,
    required this.ownerPhoneNumber,
    required this.ownerEmailAddress,
    required this.isOwner,
    required this.isRegistered,
  });

  factory OwnerModel.fromJson(Map<String, dynamic> json) {
    return OwnerModel(
      id: json['id'] ?? "N/A",
      courtName: json['courtName'] ?? "N/A",
      courtPhoneNumber: json['courtPhoneNumber'] ?? "N/A",
      courtEmailAddress: json['courtEmailAddress'] ?? "N/A",
      courtDescription: json['courtDescription'] ?? "N/A",
      openingTime: json['openingTime'] ?? "N/A",
      closingTime: json['closingTime'] ?? "N/A",
      courtLocation: json['courtLocation'] ?? "N/A",
      images: json['images'] ?? "N/A",
      ownerPhoto: json['ownerPhoto'] ?? "N/A",
      ownerFullName: json['ownerFullName'] ?? "N/A",
      ownerPhoneNumber: json['ownerPhoneNumber'] ?? "N/A",
      ownerEmailAddress: json['ownerEmailAddress'] ?? "N/A",
      isOwner: json['isOwner'] ?? false,
      isRegistered: json['isRegistered'] ?? false,
    );
  }
  factory OwnerModel.emptyOwnerModel() {
    return OwnerModel(
      id: '',
      courtName: '',
      courtPhoneNumber: '',
      courtEmailAddress: '',
      courtDescription: '',
      openingTime: '',
      closingTime: '',
      courtLocation: '',
      images: '',
      ownerPhoto: '',
      ownerFullName: '',
      ownerPhoneNumber: '',
      ownerEmailAddress: '',
      isOwner: false,
      isRegistered: false,
    );
  }

  factory OwnerModel.fromMap(Map<String, dynamic> map) {
    return OwnerModel(
      id: map['id'] ?? "N/A",
      courtName: map['courtName'] ?? "N/A",
      courtPhoneNumber: map['courtPhoneNumber'] ?? "N/A",
      courtEmailAddress: map['courtEmailAddress'] ?? "N/A",
      courtDescription: map['courtDescription'] ?? "N/A",
      openingTime: map['openingTime'] ?? "N/A",
      closingTime: map['closingTime'] ?? "N/A",
      courtLocation: map['courtLocation'] ?? "N/A",
      images: map['images'] ?? "N/A",
      ownerPhoto: map['ownerPhoto'] ?? "N/A",
      ownerFullName: map['ownerFullName'] ?? "N/A",
      ownerPhoneNumber: map['ownerPhoneNumber'] ?? "N/A",
      ownerEmailAddress: map['ownerEmailAddress'] ?? "N/A",
      isOwner: map['isOwner'] ?? false,
      isRegistered: map['isRegistered'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'courtName': courtName,
      'courtPhoneNumber': courtPhoneNumber,
      'courtEmailAddress': courtEmailAddress,
      'courtDescription': courtDescription,
      'openingTime': openingTime,
      'closingTime': closingTime,
      'courtLocation': courtLocation,
      'images': images,
      'ownerPhoto': ownerPhoto,
      'ownerFullName': ownerFullName,
      'ownerPhoneNumber': ownerPhoneNumber,
      'ownerEmailAddress': ownerEmailAddress,
      'isOwner': isOwner,
      'isRegistered': isRegistered,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'courtName': courtName,
      'courtPhoneNumber': courtPhoneNumber,
      'courtEmailAddress': courtEmailAddress,
      'courtDescription': courtDescription,
      'openingTime': openingTime,
      'closingTime': closingTime,
      'courtLocation': courtLocation,
      'images': images,
      'ownerPhoto': ownerPhoto,
      'ownerFullName': ownerFullName,
      'ownerPhoneNumber': ownerPhoneNumber,
      'ownerEmailAddress': ownerEmailAddress,
      'isOwner': isOwner,
      'isRegistered': isRegistered,
    };
  }

  factory OwnerModel.fromSnapshot(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    return OwnerModel(
      id: data['id'] ?? "N/A",
      courtName: data['courtName'] ?? "N/A",
      courtPhoneNumber: data['courtPhoneNumber'] ?? "N/A",
      courtEmailAddress: data['courtEmailAddress'] ?? "N/A",
      courtDescription: data['courtDescription'] ?? "N/A",
      openingTime: data['openingTime'] ?? "N/A",
      closingTime: data['closingTime'] ?? "N/A",
      courtLocation: data['courtLocation'] ?? "N/A",
      images: data['images'] ?? "N/A",
      ownerPhoto: data['ownerPhoto'] ?? "N/A",
      ownerFullName: data['ownerFullName'] ?? "N/A",
      ownerPhoneNumber: data['ownerPhoneNumber'] ?? "N/A",
      ownerEmailAddress: data['ownerEmailAddress'] ?? "N/A",
      isOwner: data['isOwner'] ?? true,
      isRegistered: data['isRegistered'] ?? false,
    );
  }

  String get formattedOwnerPhoneNumber =>
      Formatter.formatPhoneNumber(ownerPhoneNumber);

  List<String> splitFullName(String fullName) => fullName.split(' ');
}
