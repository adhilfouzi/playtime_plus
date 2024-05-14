import 'package:flutter/material.dart';
import '../../utils/normal_header.dart';
import '../../utils/screen/drawer.dart';
import '../utils/users_list_widget.dart';

class LargeUsersScreen extends StatelessWidget {
  const LargeUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CustomDrawer(
              screenHeight: screenHeight,
              drawerKey: 3,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const NameHeader(
                    title: "Users List",
                  ),
                  SizedBox(height: screenHeight * 0.002),
                  const Expanded(
                    child: SingleChildScrollView(
                      child: UsersListWidget(),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.002),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
