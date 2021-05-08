import 'package:flutter/material.dart';

import '../login.dart';

class FormLogin extends StatelessWidget {
  final LoginPresenter presenter;

  FormLogin(this.presenter);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          StreamBuilder<String>(
              stream: presenter.emailErrorStream,
              builder: (context, snapshot) {
                String error = snapshot.data;
                return TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email_outlined,
                    ),
                    hintText: 'Email address',
                    hintStyle: TextStyle(color: Colors.grey),
                    errorText: error == '' ? null : error,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: presenter.validateEmail,
                );
              }),
          SizedBox(
            height: 35,
          ),
          StreamBuilder<String>(
              stream: presenter.passwordErrorStream,
              builder: (context, snapshot) {
                final String error = snapshot.data;
                return TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock_outlined,
                    ),
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.grey),
                    errorText: error == '' ? null : error,
                  ),
                  onChanged: presenter.validatePassword,
                );
              }),
        ],
      ),
    );
  }
}
