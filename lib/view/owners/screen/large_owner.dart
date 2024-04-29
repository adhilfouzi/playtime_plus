import 'package:flutter/material.dart';
import '../../utils/home_widget.dart';
import '../utils/turf_list_header.dart';
import '../utils/turf_list_appbar.dart';
import '../utils/turf_list_widget.dart';

class LargeOwnerScreen extends StatelessWidget {
  const LargeOwnerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            HomeWidget().drawer(
              screenHeight: screenHeight,
              context: context,
              key: 1,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const OwnerHeader(),
                  SizedBox(height: screenHeight * 0.002),
                  TableHeaderWidget(screenWidth: screenWidth),
                  SizedBox(height: screenHeight * 0.002),
                  const Expanded(
                    child: SingleChildScrollView(
                      child: TurfListWidget(),
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
