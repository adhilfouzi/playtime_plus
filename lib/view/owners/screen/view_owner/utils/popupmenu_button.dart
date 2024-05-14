import 'dart:developer';

import 'package:admin_side_turf_application/view/owners/screen/owners_screen.dart';
import 'package:admin_side_turf_application/view/request/screen/request_screen.dart';
import 'package:flutter/material.dart';

import '../../../../../model/backend/repositories/turf_authentication.dart';
import '../../../../../model/data_model/owner_model.dart';
import '../../../../../model/utils/const/fontsize.dart';

class TurfPopupMenuButton extends StatelessWidget {
  final bool isRequest;
  final OwnerModel model;

  const TurfPopupMenuButton({
    super.key,
    required this.model,
    required this.isRequest,
  });
  @override
  Widget build(BuildContext context) {
    var status = model.isOwner ? "Disable the account" : "Activate the account";

    return PopupMenuButton<String>(
      icon: const Icon(
        Icons.more_vert,
        color: Colors.white,
      ),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'Change Password',
          child: Row(
            children: [
              const Icon(Icons.password_outlined),
              const SizedBox(width: 5),
              Text(
                'Request to Change Password',
                style: TextStyle(
                  fontSize: ResponsiveFontSize.getFontSize(context,
                      styleType: TextStyleType.normal),
                ),
              )
            ],
          ),
        ),
        PopupMenuItem<String>(
          value: 'Status',
          child: Row(
            children: [
              const Icon(Icons.delete),
              const SizedBox(width: 5),
              Text(
                status,
                style: TextStyle(
                  fontSize: ResponsiveFontSize.getFontSize(context,
                      styleType: TextStyleType.normal),
                ),
              )
            ],
          ),
        ),
      ],
      onSelected: (String value) {
        switch (value) {
          case 'Change Password':
            requestForChangePassword();
            break;
          case 'Status':
            changeStatus();
            if (isRequest) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const RequestScreen()));
            } else {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const OwnersScreen()));
            }
            break;
        }
      },
    );
  }

  void requestForChangePassword() {
    // Implement requestForChangePassword functionality
    TurfAuthentication().sendPasswordResetEmail(model.courtEmailAddress);
    log("message");
  }

  void changeStatus() {
    TurfAuthentication()
        .ownerAccountStatus(ownerId: model.id, value: model.isOwner);
    // Implement changeStatus functionality
  }
}
