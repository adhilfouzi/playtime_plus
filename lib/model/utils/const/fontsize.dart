import 'package:flutter/material.dart';

class ResponsiveFontSize {
  static double getFontSize(BuildContext context,
      {TextStyleType styleType = TextStyleType.body}) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Define font size breakpoints for different text styles
    switch (styleType) {
      case TextStyleType.h1:
        if (screenWidth < 600) {
          return 24.0;
        } else if (screenWidth >= 600 && screenWidth < 900) {
          return 28.0;
        } else {
          return 32.0;
        }
      case TextStyleType.h2:
        if (screenWidth < 600) {
          return 20.0;
        } else if (screenWidth >= 600 && screenWidth < 900) {
          return 24.0;
        } else {
          return 28.0;
        }
      case TextStyleType.h3:
        if (screenWidth < 600) {
          return 18.0;
        } else if (screenWidth >= 600 && screenWidth < 900) {
          return 20.0;
        } else {
          return 24.0;
        }
      default:
        // For body text
        if (screenWidth < 600) {
          return 14.0;
        } else if (screenWidth >= 600 && screenWidth < 900) {
          return 16.0;
        } else {
          return 18.0;
        }
    }
  }
}

enum TextStyleType {
  body,
  h1,
  h2,
  h3,
}
