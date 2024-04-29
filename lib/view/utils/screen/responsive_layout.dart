import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget extraSmallBody;
  final Widget smallBody;
  final Widget mediumBody;
  final Widget largeBody;

  const ResponsiveLayout({
    super.key,
    required this.extraSmallBody,
    required this.smallBody,
    required this.mediumBody,
    required this.largeBody,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 360) {
          return extraSmallBody;
        } else if (constraints.maxWidth < 600) {
          return smallBody;
        } else if (constraints.maxWidth < 1024) {
          return mediumBody;
        } else {
          return largeBody;
        }
      },
    );
  }
}
