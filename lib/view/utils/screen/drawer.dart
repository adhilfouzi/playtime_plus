import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../model/utils/const/colors.dart';
import '../../../model/utils/const/fontsize.dart';
import '../../../model/utils/const/image_name.dart';
import '../../homescreen/screen/homescreen.dart';
import '../../login/screen/login_screen.dart';
import '../../owners/screen/owners_screen.dart';
import '../../request/screen/request_screen.dart';
import '../../user/screen/user_screen.dart';

class CustomDrawer extends StatelessWidget {
  final double screenHeight;
  final int drawerKey;

  const CustomDrawer({
    super.key,
    required this.screenHeight,
    required this.drawerKey,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Drawer(
        elevation: 4,
        child: Container(
          color: CustomColor.darksecondarycolor,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: CustomColor.darksecondarycolor,
                ),
                child: Image.asset(
                  ImagePath.logo,
                  height: screenHeight * 2,
                ),
              ),
              CustomListTile(
                icon: Icons.dashboard,
                title: 'Dashboard',
                isSelected: drawerKey == 0,
                onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                ),
              ),
              CustomListTile(
                icon: Icons.person,
                title: 'Owners',
                isSelected: drawerKey == 1,
                onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const OwnersScreen()),
                ),
              ),
              CustomListTile(
                icon: Icons.request_page,
                title: 'Requests',
                isSelected: drawerKey == 2,
                onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (context) => const RequestScreen()),
                ),
              ),
              CustomListTile(
                icon: Icons.person,
                title: 'Users',
                isSelected: drawerKey == 3,
                onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const UsersScreen()),
                ),
              ),
              // CustomListTile(
              //   icon: Icons.ads_click,
              //   title: 'Ads',
              //   isSelected: drawerKey == 4,
              //   onTap: () => Navigator.of(context).pushReplacement(
              //     MaterialPageRoute(builder: (context) => const AdsScreen()),
              //   ),
              // ),
              CustomListTile(
                  icon: Icons.logout,
                  title: 'Logout',
                  isSelected: drawerKey == 5,
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                      (route) => false,
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final void Function()? onTap;
  final bool isSelected;

  const CustomListTile({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? Colors.blue : Colors.white,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: ResponsiveFontSize.getFontSize(
            context,
            styleType: TextStyleType.h3,
          ),
          color: isSelected ? Colors.blue : Colors.white,
        ),
      ),
      onTap: onTap ??
          () {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const OwnersScreen(),
              ),
            );
          },
    );
  }
}
