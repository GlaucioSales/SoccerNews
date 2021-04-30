import 'package:flutter/material.dart';

class SignUpAndForgetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          child: Text(
            "sign up",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
          onPressed: (){

          },
        ),
        TextButton(
          child: Text(
            "Forget Password?",
            style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold
            ),
          ),
          onPressed: (){

          },
        ),
      ],
    );
  }
}
