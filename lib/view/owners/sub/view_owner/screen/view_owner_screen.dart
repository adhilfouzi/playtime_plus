import 'package:flutter/material.dart';

import '../../../../utils/screen/responsive_layout.dart';
import 'extra_small_view_owner.dart';
import 'large_view_owner.dart';
import 'medium_view_owner.dart';
import 'small_view_owner.dart';

class ViewOwnerScreen extends StatelessWidget {
  const ViewOwnerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
          extraSmallBody: ExtraSmallViewOwner(),
          smallBody: SmallViewOwner(),
          mediumBody: MediumViewOwner(),
          largeBody: LargeViewOwner()),
    );
  }
}
