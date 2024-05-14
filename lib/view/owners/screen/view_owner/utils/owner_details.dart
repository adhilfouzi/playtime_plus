import 'dart:developer';

import 'package:admin_side_turf_application/model/data_model/owner_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../model/utils/const/colors.dart';
import '../../../../../view_model/turf_details/turf_details_bloc.dart';
import 'owner_details_widget.dart';
import 'turf_status.dart';

class TurfDetails extends StatelessWidget {
  const TurfDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<TurfDetailsBloc, TurfDetailsState>(
      builder: (context, state) {
        if (state is TurfDetailsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TurfDetailsLoaded) {
          final turfDetails = state.turfDetails;
          log(turfDetails.courtName);

          return Scaffold(
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.0002,
                  vertical: screenHeight * 0.0002),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SectionTitle(title: 'Court Information'),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  CourtDetails(turfDetails: turfDetails),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  const SectionTitle(title: 'Owner Information'),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  OwnerDetails(turfDetails: turfDetails),
                ],
              ),
            ),
          );
        } else if (state is TurfDetailsError) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const Center(child: Text("data"));
        }
      },
    );
  }
}

class CourtDetails extends StatelessWidget {
  final OwnerModel turfDetails;

  const CourtDetails({super.key, required this.turfDetails});

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
                value: turfDetails.is24h
                    ? "24H Open"
                    : '${turfDetails.openingTime} to ${turfDetails.closingTime}',
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