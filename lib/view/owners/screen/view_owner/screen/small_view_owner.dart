import 'package:flutter/material.dart';

import '../../../../utils/normal_header.dart';
import '../../../../utils/screen/drawer.dart';
import '../utils/turf_details.dart';

class SmallViewOwner extends StatelessWidget {
  final int drawerKey;

  const SmallViewOwner({super.key, required this.drawerKey});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const NamedAppbar(
        title: "Turf Details",
      ),
      drawer: CustomDrawer(
        screenHeight: screenHeight,
        drawerKey: drawerKey,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.005, vertical: screenHeight * 0.005),
        child: Row(
          children: [
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
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
