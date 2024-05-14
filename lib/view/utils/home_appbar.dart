import 'package:flutter/material.dart';
import '../../model/utils/const/colors.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const HomeAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: CustomColor.darksecondarycolor,
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      centerTitle: true,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
