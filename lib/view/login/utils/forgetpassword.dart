import 'package:flutter/material.dart';

class ForgetPasswordLink extends StatelessWidget {
  const ForgetPasswordLink({
    super.key,
    required this.isDarkMode,
  });

  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Forget Password action
      },
      child: Text(
        'Forget Password?',
        style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
      ),
    );
  }
}
