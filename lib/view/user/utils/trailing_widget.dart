import 'package:flutter/material.dart';

import '../../../model/backend/repositories/turf_authentication.dart';
import '../../../model/data_model/user_model.dart';
import '../../../model/utils/const/fontsize.dart';
import '../../user/screen/user_screen.dart';

class TrailingWidget extends StatelessWidget {
  final double screenWidth;
  final String userEmail;
  final bool isUser;
  final UserModel model;

  const TrailingWidget({
    super.key,
    required this.screenWidth,
    required this.userEmail,
    required this.isUser,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    if (screenWidth < 600) {
      return SizedBox(
        width: screenWidth * 0.5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              userEmail,
              style: TextStyle(
                fontSize: ResponsiveFontSize.getFontSize(context,
                    styleType: TextStyleType.normal),
              ),
            ),
            SizedBox(width: screenWidth * 0.01),
            Text(
              isUser ? "Active" : "Disable",
              style: TextStyle(
                fontSize: ResponsiveFontSize.getFontSize(context,
                    styleType: TextStyleType.normal),
                color: isUser ? Colors.green : Colors.redAccent,
              ),
            ),
            SizedBox(width: screenWidth * 0.01),
            IconButton(
                onPressed: () {
                  TurfAuthentication().userAccountStatus(
                      ownerId: model.id, value: model.isUser);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const UsersScreen()));
                },
                icon: Icon(
                  isUser ? Icons.cancel_outlined : Icons.check_circle_outline,
                  color: isUser ? Colors.redAccent : Colors.green,
                ))
          ],
        ),
      );
    } else {
      return SizedBox(
        width: screenWidth * 0.41,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              userEmail,
              style: TextStyle(
                fontSize: ResponsiveFontSize.getFontSize(context,
                    styleType: TextStyleType.normal),
              ),
            ),
            SizedBox(width: screenWidth * 0.02),
            Text(
              isUser ? "Active" : "Disable",
              style: TextStyle(
                  fontSize: ResponsiveFontSize.getFontSize(context,
                      styleType: TextStyleType.normal),
                  color: isUser ? Colors.green : Colors.redAccent),
            ),
            SizedBox(width: screenWidth * 0.01),
            IconButton(
                onPressed: () {
                  TurfAuthentication().userAccountStatus(
                      ownerId: model.id, value: model.isUser);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const UsersScreen()));
                },
                icon: Icon(
                  isUser ? Icons.cancel_outlined : Icons.check_circle_outline,
                  color: isUser ? Colors.redAccent : Colors.green,
                ))
          ],
        ),
      );
    }
  }
}
