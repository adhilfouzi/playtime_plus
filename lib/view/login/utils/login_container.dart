import 'package:flutter/material.dart';
import '../../utils/screen/maxwidth.dart';
import 'loginform.dart';

class LoginContainer extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: screenWidth * 0.3,
          maxWidth: constrainMaxWidth(screenWidth),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.01,
            vertical: screenHeight * 0.0112,
          ),
          decoration: BoxDecoration(
            color: isDarkMode ? Colors.grey[900] : Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: isDarkMode
                ? null
                : [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
          ),
          child: LoginForm(
            formKey: formKey,
            emailController: emailController,
            passwordController: passwordController,
            isDarkMode: isDarkMode,
            screenWidth: screenWidth,
            screenHeight: screenHeight,
          ),
        ),
      ),
    );
  }
}
