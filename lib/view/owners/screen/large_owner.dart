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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const OwnerHeader(),
                    const SizedBox(height: 16),
                    TableHeaderWidget(screenWidth: screenWidth),
                    const SizedBox(height: 8),
                    const TurfListWidget(),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
