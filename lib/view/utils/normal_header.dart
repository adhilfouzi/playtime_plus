import 'package:flutter/material.dart';

import '../../model/utils/const/fontsize.dart';

class NameHeader extends StatelessWidget {
  final String title;
  const NameHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        color: Colors.black,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.height * 0.02,
          vertical: MediaQuery.of(context).size.width * 0.01,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                overflow: TextOverflow.ellipsis,
                fontSize: ResponsiveFontSize.getFontSize(context,
                    styleType: TextStyleType.h2),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NamedAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const NamedAppbar({super.key, required this.title});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: NameHeader(
        title: title,
      ),
      // backgroundColor: Colors.transparent,
      elevation: 0, // Removes the shadow
      centerTitle: true,
    );
  }
}
