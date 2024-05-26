import 'package:flutter/material.dart';

import '../../utils/screen/responsive_layout.dart';
import 'extra_small_ads.dart';
import 'large_ads.dart';
import 'medium.dart';
import 'small_ads.dart';

class AdsScreen extends StatelessWidget {
  const AdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        smallBody: SmallAdsScreen(),
        mediumBody: MediumAdsScreen(),
        largeBody: LargeAdsScreen(),
        extraSmallBody: ExtraSmallAdsScreen(),
      ),
    );
  }
}
