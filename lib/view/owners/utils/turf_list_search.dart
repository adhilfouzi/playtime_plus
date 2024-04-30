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
      actions: [
        IconButton(
          onPressed: () {
            // Add search action
          },
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {
            // Add turf action
          },
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ],
      centerTitle: true,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
    );
  }
}

class TurfListSearchField extends StatelessWidget {
  const TurfListSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.height * 0.02),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Row(
        children: [
          Icon(Icons.search, color: CustomColor.darksecondarycolor),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search turf....',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
              style: TextStyle(color: CustomColor.darksecondarycolor),
            ),
          ),
        ],
      ),
    );
  }
}
