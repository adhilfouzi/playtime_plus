import 'package:flutter/material.dart';

import '../../utils/normal_header.dart';
import '../../utils/screen/drawer.dart';
import '../utils/request_turflist.dart';

class ExtraSmallRequestScreen extends StatelessWidget {
  const ExtraSmallRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const NamedAppbar(
        title: "Turf Account Request",
      ),
      drawer: CustomDrawer(
        screenHeight: screenHeight,
        drawerKey: 2,
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
                    child: RequestTurfList(),
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
