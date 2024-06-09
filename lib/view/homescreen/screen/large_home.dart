import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view_model/overview_bloc/overview_bloc.dart';
import '../../owners/utils/turf_list_search.dart';
import '../../utils/screen/drawer.dart';
import '../utils/overview_screen.dart';

class LargeHomeScreen extends StatelessWidget {
  const LargeHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CustomDrawer(
              screenHeight: screenHeight,
              drawerKey: 0, // Correct the key according to your implementation
            ),
            const SizedBox(width: 16), // Add spacing between drawer and appbar
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TurfListAppBar(title: '$screenWidth'),
                  SizedBox(height: 16),
                  BlocBuilder<OverviewBloc, OverviewState>(
                    builder: (context, state) {
                      if (state is OverviewLoading) {
                        return CircularProgressIndicator();
                      } else if (state is OverviewLoaded) {
                        return TurfOverviewWidget(
                            overviewData: state.overViewModel);
                      } else if (state is OverviewError) {
                        return Text('Error: ${state.errorMessage}');
                      } else {
                        return Text('Press the button to load data');
                      }
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
