import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view_model/turflist/turflist_bloc.dart';
import 'turf_list_item.dart';

class TurfListWidget extends StatelessWidget {
  const TurfListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TurflistBloc, TurflistState>(
      builder: (context, state) {
        if (state is TurfLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TurfLoaded) {
          final turfList = state.turfList;

          if (turfList.isEmpty) {
            return const Center(
              child: Text("Turfs not available"),
            );
          }

          return ListView.builder(
            shrinkWrap: true,
            itemCount: turfList.length,
            itemBuilder: (context, index) {
              final turf = turfList[index];
              return TurfListItem(
                key: ValueKey(turf.id), // Ensure unique key for each item
                screenWidth: MediaQuery.of(context).size.width,
                screenHeight: MediaQuery.of(context).size.height,
                turfName: turf.courtName,
                address: turf.courtLocation,
                timings: '${turf.openingTime} to ${turf.closingTime}',
                status: turf.isOwner,
              );
            },
          );
        } else if (state is TurfError) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return Container(); // Handle other states if needed
        }
      },
    );
  }
}
