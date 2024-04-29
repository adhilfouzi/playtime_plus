import 'package:flutter/material.dart';
import '../../utils/screen/responsive_layout.dart';
import 'extra_small_request.dart';
import 'large_request.dart';
import 'medium_request.dart';
import 'small_request.dart';

class RequestScreen extends StatelessWidget {
  const RequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        extraSmallBody: ExtraSmallRequestScreen(),
        smallBody: SmallRequestScreen(),
        mediumBody: MediumRequestScreen(),
        largeBody: LargeRequestScreen(),
      ),
    );
  }
}
