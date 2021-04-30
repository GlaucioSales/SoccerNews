import 'package:flutter/material.dart';

import 'login.dart';

class LoginPage extends StatelessWidget {
  final LoginPresenter presenter;

  LoginPage(this.presenter);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          BackgroundLoginPage(),
          ContentLoginPage(presenter),
        ],
      ),
    );
  }
}
