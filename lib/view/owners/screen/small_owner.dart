import 'package:admin_side_turf_application/view/utils/screen/drawer.dart';
import 'package:flutter/material.dart';

import '../utils/turf_list_widget.dart';
import '../utils/turf_list_search.dart';

class SmallOwnerScreen extends StatelessWidget {
  const SmallOwnerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const TurfListAppBar(title: 'Turf List'),
      drawer: CustomDrawer(screenHeight: screenHeight, drawerKey: 1),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenHeight * 0.002,
          vertical: screenWidth * 0.001,
        ),
        child: const Row(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TurfListWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
