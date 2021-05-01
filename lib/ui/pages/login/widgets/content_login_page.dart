import 'package:flutter/material.dart';

import '../login.dart';

class ContentLoginPage extends StatelessWidget {
  final LoginPresenter presenter;

  ContentLoginPage(this.presenter);

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
            FormLogin(presenter),
            SignInLogin(presenter),
            LoginWithSocial(),
            SignUpAndForgetPassword(),
          ],
        ),
      ),
    );
  }
}
