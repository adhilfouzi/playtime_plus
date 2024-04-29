import 'package:flutter/material.dart';

import '../../utils/home_widget.dart';

class SmallRequestScreen extends StatelessWidget {
  const SmallRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: HomeWidget().appbar(title: 'Owners'),
      drawer: HomeWidget()
          .drawer(screenHeight: screenHeight, context: context, key: 2),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Screen Size: Small',
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
