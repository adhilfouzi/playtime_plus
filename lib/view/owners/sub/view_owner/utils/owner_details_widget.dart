import 'package:flutter/material.dart';

import '../../../../../model/utils/const/colors.dart';
import '../../../../../model/utils/const/fontsize.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: ResponsiveFontSize.getFontSize(context,
              styleType: TextStyleType.h2),
          fontWeight: FontWeight.bold,
          color: CustomColor.mainColor,
        ),
      ),
    );
  }
}

class DetailRow extends StatelessWidget {
  final IconData icon;
  final String value;
  final double screenWidth;

  const DetailRow({
    super.key,
    required this.icon,
    required this.value,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: CustomColor.mainColor,
          size: screenWidth < 600 ? 24.0 : 28.0,
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: ResponsiveFontSize.getFontSize(context),
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}
