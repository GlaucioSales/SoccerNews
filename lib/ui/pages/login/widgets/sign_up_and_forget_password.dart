import 'package:flutter/material.dart';

class SignUpAndForgetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "sign up",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          "Forget Password?",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
