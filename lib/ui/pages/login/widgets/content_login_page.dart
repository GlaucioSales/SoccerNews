import 'package:flutter/material.dart';

import 'widgets.dart';

class ContentLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(32, 64, 32, 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWelcomeBack(),
            FormLogin(),
            SignInLogin(),
            LoginWithSocial(),
            SignUpAndForgetPassword(),
          ],
        ),
      ),
    );
  }
}
