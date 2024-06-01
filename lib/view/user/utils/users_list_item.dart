import 'package:flutter/material.dart';
import '../../../model/data_model/user_model.dart';
import '../../../model/utils/const/fontsize.dart';
import 'trailing_widget.dart';

class UserListItem extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final String userName;
  final String userNumber;
  final String userEmail;
  final String userProfile;
  final bool isUser;
  final UserModel model;

  const UserListItem({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.userName,
    required this.userNumber,
    required this.userEmail,
    required this.userProfile,
    required this.isUser,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ListTile(
        leading: screenWidth < 600
            ? null
            : Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.asset(
                      height: screenHeight * 0.05,
                      "assets/image/profile.png",
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
        title: Text(
          userName,
          style: TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: ResponsiveFontSize.getFontSize(context,
                  styleType: TextStyleType.h3),
              fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          userNumber,
          style: TextStyle(
            overflow: TextOverflow.ellipsis,
            fontSize: ResponsiveFontSize.getFontSize(context,
                styleType: TextStyleType.normal),
          ),
        ),
        trailing: TrailingWidget(
          screenWidth: screenWidth,
          userEmail: userEmail,
          isUser: isUser,
          model: model,
        ),
      ),
    );
  }
}
