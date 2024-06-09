import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../view_model/overview_bloc/overview_bloc.dart';
import '../../owners/utils/turf_list_search.dart';
import '../../utils/screen/drawer.dart';
import '../utils/overview_screen.dart';

class SmallHomeScreen extends StatelessWidget {
  const SmallHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: TurfListAppBar(title: '$screenWidth'),
      drawer: CustomDrawer(screenHeight: screenHeight, drawerKey: 0),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              BlocBuilder<OverviewBloc, OverviewState>(
                builder: (context, state) {
                  if (state is OverviewLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is OverviewLoaded) {
                    return TurfOverviewWidget(
                        overviewData: state.overViewModel);
                  } else if (state is OverviewError) {
                    return Center(
                      child: Text('Error: ${state.errorMessage}'),
                    );
                  } else {
                    return const Center(
                      child: Text('Press the button to load data'),
                    );
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
