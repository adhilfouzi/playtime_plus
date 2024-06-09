import 'package:admin_side_turf_application/view/homescreen/utils/overview_screen.dart';
import 'package:flutter/material.dart';
import '../../../view_model/overview_bloc/overview_bloc.dart';
import '../../owners/utils/turf_list_search.dart';
import '../../utils/screen/drawer.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class MediumHomeScreen extends StatelessWidget {
  const MediumHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: TurfListAppBar(title: '$screenWidth'),
      drawer: CustomDrawer(screenHeight: screenHeight, drawerKey: 0),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenHeight * 0.02,
            vertical: screenWidth * 0.01,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
        ),
      ),
    );
  }
}
