import 'package:flutter/material.dart';

import '../../../../utils/home_widget.dart';
import '../../../../utils/normal_header.dart';
import '../utils/owner_details.dart';

class MediumViewOwner extends StatelessWidget {
  const MediumViewOwner({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const NamedAppbar(
        title: "Turf Details",
      ),
      drawer: HomeWidget().drawer(
        screenHeight: screenHeight,
        context: context,
        key: 2,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.005, vertical: screenHeight * 0.005),
        child: Row(
          children: [
            // SizedBox(height: screenHeight * 0.002),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.002),
                  const Expanded(
                    child: TurfDetails(),
                  ),
                  SizedBox(height: screenHeight * 0.002),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
