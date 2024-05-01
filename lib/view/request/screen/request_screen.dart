import 'package:admin_side_turf_application/view_model/request_turflist/request_turflist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/screen/responsive_layout.dart';
import 'extra_small_request.dart';
import 'large_request.dart';
import 'medium_request.dart';
import 'small_request.dart';

class RequestScreen extends StatelessWidget {
  const RequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => RequestTurflistBloc()..add(RequesFetchTurfId()),
        child: const ResponsiveLayout(
          extraSmallBody: ExtraSmallRequestScreen(),
          smallBody: SmallRequestScreen(),
          mediumBody: MediumRequestScreen(),
          largeBody: LargeRequestScreen(),
        ),
      ),
    );
  }
}
