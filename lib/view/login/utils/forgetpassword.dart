import 'dart:developer';

import 'package:admin_side_turf_application/model/utils/portion/snackbar.dart';
import 'package:flutter/material.dart';

import '../../../model/backend/manager/firebase_authentication.dart';

class ForgetPasswordLink extends StatelessWidget {
  final TextEditingController emailController;

  const ForgetPasswordLink({
    super.key,
    required this.emailController,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (emailController.text.isNotEmpty) {
          await AuthenticationRepository()
              .sendPasswordResetEmail(emailController.text.toLowerCase());
          log('sendPasswordResetEmail');
        } else if (emailController.text.isEmpty) {
          CustomSnackBar.showInfo(context, "Email cannot be empty");
        } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
            .hasMatch(emailController.text)) {
          CustomSnackBar.showInfo(context, 'Invalid email format');
        }
      },
      child: Text(
        'Forget Password?',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
