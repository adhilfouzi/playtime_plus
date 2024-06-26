import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view_model/request_turflist/request_turflist_bloc.dart';
import '../../owners/utils/turf_list_item.dart';

class RequestTurfList extends StatelessWidget {
  const RequestTurfList({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestTurflistBloc, RequestTurflistState>(
      builder: (context, state) {
        if (state is RequestTurflistLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is RequestTurflistLoaded) {
          final turfList = state.requestTurflist;

          if (turfList.isEmpty) {
            return const Center(
              child: Text(
                "Turfs not available",
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            );
          } else {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<RequestTurflistBloc>().add(RequesFetchTurfId());
              },
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: turfList.length,
                itemBuilder: (context, index) {
                  final turf = turfList[index];
                  return TurfListItem(
                    key: ValueKey(turf.id), // Ensure unique key for each item
                    model: turf,
                  );
                },
              ),
            );
          }
        } else if (state is RequestTurflistError) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const Center(
            child: Text("Another state"),
          ); // Handle other states if needed
        }
      },
    );
  }
}
