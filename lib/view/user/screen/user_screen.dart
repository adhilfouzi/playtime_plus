import 'package:flutter/material.dart';

import '../../utils/screen/responsive_layout.dart';
import 'extra_small_users.dart';
import 'large_users.dart';
import 'medium_users.dart';
import 'small_users.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        extraSmallBody: ExtraSmallUsersScreen(),
        smallBody: SmallUsersScreen(),
        mediumBody: MediumUsersScreen(),
        largeBody: LargeUsersScreen(),
      ),
    );
  }
}
