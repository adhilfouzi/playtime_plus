import 'package:flutter/material.dart';
import '../../utils/screen/responsive_layout.dart';
import 'extra_small_home.dart';
import 'large_home.dart';
import 'medium_home.dart';
import 'small_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        smallBody: SmallHomeScreen(),
        mediumBody: MediumHomeScreen(),
        largeBody: LargeHomeScreen(),
        extraSmallBody: ExtraSmallHomeScreen(),
      ),
    );
  }
}
