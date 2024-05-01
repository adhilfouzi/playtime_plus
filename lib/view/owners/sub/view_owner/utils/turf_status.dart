import 'package:flutter/material.dart';

import '../../../../../model/utils/const/colors.dart';

class OwnerStatusWidget extends StatelessWidget {
  final bool isOwner;

  const OwnerStatusWidget({super.key, required this.isOwner});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.verified_user,
          color: CustomColor.mainColor,
        ),
        const SizedBox(width: 5),
        Text(
          isOwner ? "Active Account" : "Disabled Account",
          style: TextStyle(
            color: isOwner ? Colors.green : Colors.red,
          ),
        ),
      ],
    );
  }
}

class RegistrationStatusWidget extends StatelessWidget {
  final bool isRegistered;

  const RegistrationStatusWidget({super.key, required this.isRegistered});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          isRegistered ? Icons.done : Icons.clear,
          color: CustomColor.mainColor,
        ),
        const SizedBox(width: 5),
        Text(
          isRegistered ? "Registered" : "Not Registered",
          style: TextStyle(
            color: isRegistered ? Colors.green : Colors.red,
          ),
        ),
      ],
    );
  }
}
