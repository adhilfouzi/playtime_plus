import 'package:flutter/material.dart';

import '../../../../utils/normal_header.dart';
import '../../../../utils/screen/drawer.dart';
import '../utils/owner_details.dart';

class LargeViewOwner extends StatelessWidget {
  final int drawerKey;
  const LargeViewOwner({super.key, required this.drawerKey});

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CustomDrawer(
              screenHeight: screenHeight,
              drawerKey: drawerKey,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const NameHeader(
                    title: "Turf Details",
                  ),
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
