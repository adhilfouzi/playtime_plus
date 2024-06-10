import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../model/backend/manager/firebase_authentication.dart';
import '../../../model/utils/const/fontsize.dart';
import '../../../model/utils/portion/snackbar.dart';
import '../../homescreen/screen/homescreen.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return ElevatedButton(
      onPressed: () async {
        if (!formKey.currentState!.validate()) return;
        log('Formkey validate');
        var isAdmin = await AuthenticationRepository()
            .signInWithEmailAndPassword(
                emailController.text, passwordController.text);
        if (isAdmin) {
          log("SigninSuccess: Admin user");
          // Navigate to the admin dashboard or appropriate screen
          // For example:
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (contax) => const HomeScreen(),
          ));
        } else {
          log("SigninSuccess: Regular user");
          // Handle regular user logic or show an error message
          // For example:
          // Get.back();
          CustomSnackBar.showError(context,
              'Your account has some issue. Please contact support for assistance.');
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromRGBO(68, 138, 255, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.005,
        ),
        child: Text(
          'Log in',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: ResponsiveFontSize.getFontSize(context),
              color: Colors.black),
        ),
      ),
    );
  }
}
