import 'package:admin_side_turf_application/view/utils/screen/drawer.dart';
import 'package:flutter/material.dart';

import '../utils/turf_list_widget.dart';
import '../utils/turf_list_search.dart';

class MediumOwnerScreen extends StatelessWidget {
  const MediumOwnerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const TurfListAppBar(title: 'Turf List'),
      drawer: CustomDrawer(screenHeight: screenHeight, drawerKey: 1),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenHeight * 0.02,
          vertical: screenWidth * 0.01,
        ),
        child: Row(
          children: [
            SizedBox(width: screenWidth * 0.01),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  SizedBox(height: 8),
                  Expanded(
                    child: SingleChildScrollView(
                      child: TurfListWidget(),
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
