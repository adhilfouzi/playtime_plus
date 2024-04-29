import 'package:flutter/material.dart';

import '../../utils/home_widget.dart';

class LargeRequestScreen extends StatelessWidget {
  const LargeRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            HomeWidget().drawer(
              screenHeight: screenHeight,
              context: context,
              key: 2, // Correct the key according to your implementation
            ),
            const SizedBox(width: 16), // Add spacing between drawer and appbar
            Expanded(
              child: Column(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: HomeWidget().appbar(title: 'Owners')),
                  const SizedBox(
                      height: 16), // Add spacing between appbar and text
                  const Text(
                    'Screen Size: Large',
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
            )
          ],
        ),
      ),
    );
  }
}
