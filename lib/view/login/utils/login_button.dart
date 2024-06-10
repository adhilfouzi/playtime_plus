import 'package:flutter/material.dart';

import '../../../model/utils/const/fontsize.dart';
import '../../homescreen/screen/homescreen.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.formKey,
    required this.screenWidth,
    required this.screenHeight,
  });

  final GlobalKey<FormState> formKey;
  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (contax) => const HomeScreen(),
        ));
        if (formKey.currentState!.validate()) {}
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
