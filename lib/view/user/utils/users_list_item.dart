import 'package:admin_side_turf_application/view/user/screen/user_screen.dart';
import 'package:flutter/material.dart';

import '../../../model/backend/repositories/turf_authentication.dart';
import '../../../model/data_model/user_model.dart';
import '../../../model/utils/const/fontsize.dart';

class UserListItem extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final String userName;
  final String userNumber;
  final String userEmail;
  final String userProfile;
  final bool isUser;
  final UserModel model; // Assuming UserModel is defined in this file

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
        // onTap: () {
        //   // BlocProvider.of<UserDetailsBloc>(context).add(FetchUserId(model.id));
        //   // log(model.name);
        //   // Navigator.of(context).push(
        //   //     MaterialPageRoute(builder: (context) => const ViewUserScreen()));
        // },
        leading: screenWidth < 600
            ? null
            : Container(
                // width: screenWidth * 0.05,
                // height: screenHeight * 0.05,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: AspectRatio(
                    aspectRatio: 16 / 9, // Adjust aspect ratio as needed
                    child: Image.asset(
                      height: screenHeight * 0.05,
                      // width: screenWidth * 0.05,
                      "assets/image/profile.png",
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
        title: Text(
          userName,
          style: TextStyle(
              fontSize: ResponsiveFontSize.getFontSize(context,
                  styleType: TextStyleType.h3),
              fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          userNumber,
          style: TextStyle(
            fontSize: ResponsiveFontSize.getFontSize(context,
                styleType: TextStyleType.normal),
          ),
        ),
        trailing: buildTrailing(context),
      ),
    );
  }

  Widget buildTrailing(BuildContext context) {
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
                onPressed: () {},
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
