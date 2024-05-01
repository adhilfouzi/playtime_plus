import 'dart:developer';

import 'package:admin_side_turf_application/view/owners/sub/view_owner/screen/view_owner_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/data_model/owner_model.dart';
import '../../../model/utils/const/fontsize.dart';
import '../../../view_model/turf_details/turf_details_bloc.dart';
import '../sub/view_owner/utils/popupmenu_button.dart';

class TurfListItem extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final String turfName;
  final String address;
  final String timings;
  final OwnerModel model;
  final bool status;

  const TurfListItem({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.turfName,
    required this.address,
    required this.timings,
    required this.status,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ListTile(
        onTap: () {
          BlocProvider.of<TurfDetailsBloc>(context).add(FetchTurfId(model.id));
          log(model.courtName);
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ViewOwnerScreen()));
        },
        leading: screenWidth < 600
            ? null
            : Container(
                width: screenWidth * 0.05,
                height: screenHeight * 0.05,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: AspectRatio(
                    aspectRatio: 16 / 9, // Adjust aspect ratio as needed
                    child: Image.asset(
                      "assets/image/turf_image.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
        title: Text(
          turfName,
          style: TextStyle(
            fontSize: ResponsiveFontSize.getFontSize(context),
          ),
        ),
        subtitle: Text(
          address,
          style: TextStyle(fontSize: ResponsiveFontSize.getFontSize(context)),
        ),
        trailing: buildTrailing(context),
      ),
    );
  }

  Widget buildTrailing(BuildContext context) {
    if (screenWidth < 600) {
      return SizedBox(
        width: screenWidth * 0.45,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              timings,
              style: TextStyle(
                fontSize: ResponsiveFontSize.getFontSize(context,
                    styleType: TextStyleType.normal),
              ),
            ),
            SizedBox(width: screenWidth * 0.017),
            Text(
              status ? "Active" : "Disable",
              style: TextStyle(
                fontSize: ResponsiveFontSize.getFontSize(context,
                    styleType: TextStyleType.normal),
                color: status ? Colors.green : Colors.redAccent,
              ),
            ),
            SizedBox(width: screenWidth * 0.017),
            TurfPopupMenuButton(
              model: model,
            ),
          ],
        ),
      );
    } else {
      return SizedBox(
        width: screenWidth * 0.41,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              timings,
              style: TextStyle(
                fontSize: ResponsiveFontSize.getFontSize(context,
                    styleType: TextStyleType.normal),
              ),
            ),
            SizedBox(width: screenWidth * 0.02),
            Text(
              status ? "Active" : "Disable",
              style: TextStyle(
                  fontSize: ResponsiveFontSize.getFontSize(context,
                      styleType: TextStyleType.normal),
                  color: status ? Colors.green : Colors.redAccent),
            ),
            SizedBox(width: screenWidth * 0.017),
            TurfPopupMenuButton(
              model: model,
            ),
          ],
        ),
      );
    }
  }
}
