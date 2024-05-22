import 'package:admin_side_turf_application/model/data_model/owner_model.dart';
import 'package:flutter/material.dart';
import '../../../../../model/utils/const/colors.dart';
import 'owner_details_widget.dart';

class OwnerDetails extends StatelessWidget {
  final OwnerModel turfDetails;
  const OwnerDetails({super.key, required this.turfDetails});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Card(
      color: CustomColor.slotunavailable[200],
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04, vertical: screenHeight * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailRow(
                icon: Icons.person,
                value: turfDetails.ownerFullName,
                screenWidth: screenWidth),
            SizedBox(height: screenHeight * 0.02),
            DetailRow(
                icon: Icons.phone,
                value: turfDetails.ownerPhoneNumber,
                screenWidth: screenWidth),
            SizedBox(height: screenHeight * 0.02),
            DetailRow(
                icon: Icons.email,
                value: turfDetails.ownerEmailAddress,
                screenWidth: screenWidth),
          ],
        ),
      ),
    );
  }
}
