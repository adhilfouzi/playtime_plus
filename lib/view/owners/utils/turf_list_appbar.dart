import 'package:flutter/material.dart';

import '../../../model/utils/const/fontsize.dart';

class TableHeaderWidget extends StatelessWidget {
  final double screenWidth;

  const TableHeaderWidget({
    super.key,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: screenWidth * 0.32,
          child: Text(
            'Turf Name',
            style: TextStyle(
              fontSize: ResponsiveFontSize.getFontSize(context),
            ),
            textAlign: TextAlign.start,
          ),
        ),
        Text(
          'Timings',
          style: TextStyle(
            fontSize: ResponsiveFontSize.getFontSize(context),
          ),
        ),
        Text(
          'Status',
          style: TextStyle(
            fontSize: ResponsiveFontSize.getFontSize(context),
          ),
        ),
        Text(
          'Edit',
          style: TextStyle(
            fontSize: ResponsiveFontSize.getFontSize(context),
          ),
        ),
      ],
    );
  }
}
