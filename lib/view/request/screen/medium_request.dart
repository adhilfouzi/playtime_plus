import 'package:flutter/material.dart';

import '../../utils/home_widget.dart';
import '../../utils/normal_header.dart';
import '../utils/request_turflist.dart';

class MediumRequestScreen extends StatelessWidget {
  const MediumRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const NamedAppbar(
        title: "Turf Account Request",
      ),
      drawer: HomeWidget().drawer(
        screenHeight: screenHeight,
        context: context,
        key: 2,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.0002, vertical: screenHeight * 0.0002),
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
