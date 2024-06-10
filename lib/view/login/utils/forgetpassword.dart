import 'package:flutter/material.dart';

class ForgetPasswordLink extends StatelessWidget {
  const ForgetPasswordLink({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Forget Password action
      },
      child: Text(
        'Forget Password?',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
