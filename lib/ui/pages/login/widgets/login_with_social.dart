import 'package:flutter/material.dart';

class LoginWithSocial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(icon: Icon(Icons.add_circle), onPressed: () {}),
          IconButton(icon: Icon(Icons.add_circle), onPressed: () {}),
          IconButton(icon: Icon(Icons.add_circle), onPressed: () {}),
        ],
      ),
    );
  }
}
