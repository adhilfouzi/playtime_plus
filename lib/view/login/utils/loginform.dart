import 'package:flutter/material.dart';
import '../../../model/controller/validator.dart';
import '../../../model/utils/portion/textfield.dart';
import 'forgetpassword.dart';
import 'login_button.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.isDarkMode,
    required this.screenWidth,
    required this.screenHeight,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isDarkMode;
  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: screenHeight * 0.03),
          Text(
            'Login',
            style: TextStyle(
              color: isDarkMode ? Colors.blueAccent : Colors.blue,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: screenHeight * 0.03),
          MyTextField(
            controller: emailController,
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
            validator: (value) => InputValidators.validateEmail(value),
          ),
          SizedBox(height: screenHeight * 0.001),
          PasswordTextField(
            controller: passwordController,
          ),
          SizedBox(height: screenHeight * 0.03),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.04,
            ),
            child: LoginButton(
              formKey: formKey,
              isDarkMode: isDarkMode,
              screenWidth: screenWidth,
              screenHeight: screenHeight,
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          ForgetPasswordLink(isDarkMode: isDarkMode),
          SizedBox(height: screenHeight * 0.02),
        ],
      ),
    );
  }
}
