import 'package:flutter/material.dart';

import '../../../model/utils/const/fontsize.dart';

class CustomColor {
  static const Color darksecondarycolor = Colors.black;
}

class TurfListAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const TurfListAppBar({
    super.key,
    required this.title,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: CustomColor.darksecondarycolor,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: ResponsiveFontSize.getFontSize(context,
              styleType: TextStyleType.h1),
        ),
      ),
      centerTitle: true,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
    );
  }
}
