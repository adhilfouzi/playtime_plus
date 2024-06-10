import 'package:flutter/material.dart';
import '../../../model/controller/validator.dart';
import '../../../model/utils/const/fontsize.dart';
import '../../../model/utils/portion/textfield.dart';
import 'forgetpassword.dart';
import 'login_button.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
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
              color: Colors.blueAccent,
              fontSize: ResponsiveFontSize.getFontSize(context,
                  styleType: TextStyleType.h1),
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: screenHeight * 0.03),
          MyTextField(
            controller: emailController,
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: (value) => InputValidators.validateEmail(value),
          ),
          SizedBox(height: screenHeight * 0.001),
          PasswordTextField(
            textInputAction: TextInputAction.done,
            controller: passwordController,
          ),
          SizedBox(height: screenHeight * 0.03),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.04,
            ),
            child: LoginButton(
              emailController: emailController,
              passwordController: passwordController,
              formKey: formKey,
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          ForgetPasswordLink(emailController: emailController),
          SizedBox(height: screenHeight * 0.02),
        ],
      ),
    );
  }
}
