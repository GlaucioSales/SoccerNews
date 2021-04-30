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
        ClipOval(
          child: Material(
            color: Theme.of(context).primaryColor, // button color
            child: InkWell(
              splashColor: Theme.of(context).accentColor, // inkwell color
              child: SizedBox(
                width: 52,
                height: 52,
                child: Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.white,
                ),
              ),
              onTap: null,
            ),
          ),
        ),
      ],
    );
  }
}
