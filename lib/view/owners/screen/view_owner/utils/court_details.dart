import 'package:flutter/material.dart';

import '../../../../../model/controller/formater.dart';
import '../../../../../model/data_model/owner_model.dart';
import '../../../../../model/utils/const/colors.dart';
import 'owner_details_widget.dart';
import 'turf_status.dart';

class CourtDetails extends StatelessWidget {
  final OwnerModel turfDetails;

  const CourtDetails({super.key, required this.turfDetails});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    var opening = Formatter.timeOfDayToString(turfDetails.openingTime);
    var closeing = Formatter.timeOfDayToString(turfDetails.closingTime);
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
                icon: Icons.person_pin,
                value: turfDetails.courtName,
                screenWidth: screenWidth),
            SizedBox(height: screenHeight * 0.02),
            DetailRow(
                icon: Icons.location_on,
                value: turfDetails.courtLocation,
                screenWidth: screenWidth),
            SizedBox(height: screenHeight * 0.02),
            DetailRow(
                icon: Icons.phone,
                value: turfDetails.courtPhoneNumber,
                screenWidth: screenWidth),
            SizedBox(height: screenHeight * 0.02),
            DetailRow(
                icon: Icons.email,
                value: turfDetails.courtEmailAddress,
                screenWidth: screenWidth),
            SizedBox(height: screenHeight * 0.02),
            DetailRow(
                icon: Icons.access_time,
                value: turfDetails.is24h ? "24H Open" : '$opening to $closeing',
                screenWidth: screenWidth),
            SizedBox(height: screenHeight * 0.02),
            DetailRow(
              icon: Icons.info,
              value: turfDetails.courtDescription,
              screenWidth: screenWidth,
            ),
            SizedBox(height: screenHeight * 0.02),
            OwnerStatusWidget(isOwner: turfDetails.isOwner),
            SizedBox(height: screenHeight * 0.02),
            RegistrationStatusWidget(isRegistered: turfDetails.isRegistered),
          ],
        ),
      ),
    );
  }
}
