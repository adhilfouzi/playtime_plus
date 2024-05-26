import 'package:flutter/material.dart';

import '../../utils/home_appbar.dart';
import '../../utils/screen/drawer.dart';

class ExtraSmallAdsScreen extends StatelessWidget {
  const ExtraSmallAdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const HomeAppBar(title: 'Dashboard'),
      drawer: CustomDrawer(screenHeight: screenHeight, drawerKey: 4),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Screen Size: ExtraSmall',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Width: $screenWidth\nHeight: $screenHeight',
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
