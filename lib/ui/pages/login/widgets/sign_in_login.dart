import 'package:flutter/material.dart';

class SignInLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Sign in",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        ElevatedButton(
          child: Icon(
            Icons.arrow_forward_ios_sharp,
            color: Colors.white,
          ),
          onPressed: null,
        ),
      ],
    );
  }
}
