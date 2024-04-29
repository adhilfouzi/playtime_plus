import 'package:flutter/material.dart';
import '../../../model/utils/const/image_name.dart';
import '../utils/login_container.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              ImagePath.welcome,
              fit: BoxFit.cover,
            ),
          ),
          Center(child: LoginContainer()),
        ],
      ),
    );
  }
}
