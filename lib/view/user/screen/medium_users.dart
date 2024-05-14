import 'package:flutter/material.dart';
import '../../utils/normal_header.dart';
import '../../utils/screen/drawer.dart';
import '../utils/users_list_widget.dart';

class MediumUsersScreen extends StatelessWidget {
  const MediumUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const NamedAppbar(
        title: "Users List",
      ),
      drawer: CustomDrawer(
        screenHeight: screenHeight,
        drawerKey: 3,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: screenHeight * 0.002),
                  const Expanded(
                    child: UsersListWidget(),
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
