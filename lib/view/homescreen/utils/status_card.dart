import 'package:flutter/material.dart';

import '../../../model/utils/const/fontsize.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;

  const StatCard({required this.title, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Card(
      elevation: 4,
      child: Container(
        height: screenHeight * 0.05,
        width: screenWidth * 0.05,
        color: Colors.black45,
        padding: EdgeInsets.symmetric(
          horizontal: screenHeight * 0.02,
          vertical: screenWidth * 0.01,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: ResponsiveFontSize.getFontSize(context),
              ),
            ),
            // SizedBox(height: 10),
            Text(
              value,
              style: TextStyle(
                fontSize: ResponsiveFontSize.getFontSize(context,
                    styleType: TextStyleType.h3),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
