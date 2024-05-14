import 'package:flutter/material.dart';

import '../../../../utils/normal_header.dart';
import '../../../../utils/screen/drawer.dart';
import '../utils/owner_details.dart';

class ExtraSmallViewOwner extends StatelessWidget {
  final int drawerKey;

  const ExtraSmallViewOwner({super.key, required this.drawerKey});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const NamedAppbar(
        title: "Turf Details",
      ),
      drawer: CustomDrawer(
        screenHeight: screenHeight,
        drawerKey: drawerKey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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
