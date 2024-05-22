import 'package:flutter/material.dart';

import '../../../model/data_model/owner_model.dart';
import '../../../model/utils/const/fontsize.dart';
import '../screen/view_owner/utils/popupmenu_button.dart';

class TrailingWidget extends StatelessWidget {
  final OwnerModel model;

  const TrailingWidget({
    required this.model,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    if (width < 600) {
      return SizedBox(
        width: width * 0.5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              model.courtPhoneNumber,
              style: TextStyle(
                fontSize: ResponsiveFontSize.getFontSize(context),
              ),
            ),
            SizedBox(width: width * 0.017),
            Text(
              model.isOwner ? "Active" : "Disabled",
              style: TextStyle(
                fontSize: ResponsiveFontSize.getFontSize(context),
                color: model.isOwner ? Colors.green : Colors.redAccent,
              ),
            ),
            TurfPopupMenuButton(
              model: model,
            ),
          ],
        ),
      );
    } else {
      return SizedBox(
        width: width * 0.41,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              model.courtPhoneNumber,
              style: TextStyle(
                fontSize: ResponsiveFontSize.getFontSize(context),
              ),
            ),
            SizedBox(width: width * 0.02),
            Text(
              model.isOwner ? "Active" : "Disabled",
              style: TextStyle(
                fontSize: ResponsiveFontSize.getFontSize(context),
                color: model.isOwner ? Colors.green : Colors.redAccent,
              ),
            ),
            TurfPopupMenuButton(
              model: model,
            ),
          ],
        ),
      );
    }
  }
}
