import 'package:flutter/material.dart';

import '../../../../utils/screen/responsive_layout.dart';
import 'extra_small_view_owner.dart';
import 'large_view_owner.dart';
import 'medium_view_owner.dart';
import 'small_view_owner.dart';

class ViewOwnerScreen extends StatelessWidget {
  final int drawerKey;
  const ViewOwnerScreen({super.key, required this.drawerKey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
          extraSmallBody: ExtraSmallViewOwner(drawerKey: drawerKey),
          smallBody: SmallViewOwner(drawerKey: drawerKey),
          mediumBody: MediumViewOwner(drawerKey: drawerKey),
          largeBody: LargeViewOwner(drawerKey: drawerKey)),
    );
  }
}
