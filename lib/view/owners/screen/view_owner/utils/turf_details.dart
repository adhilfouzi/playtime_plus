import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../view_model/turf_details/turf_details_bloc.dart';
import 'court_details.dart';
import 'owner_details.dart';
import 'owner_details_widget.dart';

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
