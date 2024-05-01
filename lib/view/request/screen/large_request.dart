import 'package:flutter/material.dart';

import '../../utils/home_widget.dart';
import '../../utils/normal_header.dart';
import '../utils/request_turflist.dart';

class LargeRequestScreen extends StatelessWidget {
  const LargeRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            HomeWidget().drawer(
              screenHeight: screenHeight,
              context: context,
              key: 2,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const NameHeader(
                    title: "Turf Account Request",
                  ),
                  SizedBox(height: screenHeight * 0.002),
                  // TableHeaderWidget(screenWidth: screenWidth),
                  SizedBox(height: screenHeight * 0.002),
                  const Expanded(
                    child: SingleChildScrollView(
                      child: RequestTurfList(),
                    ),
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
