import 'package:flutter/material.dart';
import '../../utils/normal_header.dart';
import '../../utils/screen/drawer.dart';
import '../utils/turf_list_widget.dart';

class LargeOwnerScreen extends StatelessWidget {
  const LargeOwnerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.02, vertical: height * 0.025),
        child: Row(
          children: [
            CustomDrawer(
              screenHeight: height,
              drawerKey: 1,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const NameHeader(
                    title: "Turf List",
                  ),
                  SizedBox(height: height * 0.002),
                  // TableHeaderWidget(screenWidth: screenWidth),
                  SizedBox(height: height * 0.002),
                  const Expanded(
                    child: SingleChildScrollView(
                      child: TurfListWidget(),
                    ),
                  ),
                  SizedBox(height: height * 0.002),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
