import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/utils/const/colors.dart';
import '../../../view_model/Image_controller/image_controller_bloc.dart';
import '../../utils/home_appbar.dart';
import '../../utils/screen/drawer.dart';
import '../utils/ads_grid.dart';

class SmallAdsScreen extends StatelessWidget {
  const SmallAdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: const HomeAppBar(title: 'Ads'),
      drawer: CustomDrawer(screenHeight: height, drawerKey: 4),
      body: const AdsGrid(), // Use the AdsGrid widget here
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          context.read<ImageBloc>().add(PickImageEvent());
        },
        backgroundColor: CustomColor.mainColor,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
