import 'dart:developer';
import 'package:admin_side_turf_application/view/owners/screen/view_owner/screen/view_owner_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/data_model/owner_model.dart';
import '../../../model/utils/const/fontsize.dart';
import '../../../view_model/turf_details/turf_details_bloc.dart';
import 'trailing_widget.dart'; // Make sure to import the new TrailingWidget

class TurfListItem extends StatelessWidget {
  final OwnerModel model;

  const TurfListItem({
    super.key,
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
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  ViewOwnerScreen(drawerKey: model.isRegistered ? 1 : 2)));
        },
        title: Text(
          model.courtName,
          style: TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: ResponsiveFontSize.getFontSize(context,
                  styleType: TextStyleType.h3),
              fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          model.courtLocation,
          style: TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: ResponsiveFontSize.getFontSize(context,
                  styleType: TextStyleType.normal)),
        ),
        trailing: TrailingWidget(
          model: model,
        ),
      ),
    );
  }
}
