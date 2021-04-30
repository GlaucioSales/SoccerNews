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
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.email_outlined,
              ),
              hintText: 'Email address',
              hintStyle: TextStyle(color: Colors.grey),
            ),
            keyboardType: TextInputType.emailAddress,
            onChanged: presenter.validateEmail,
          ),
          SizedBox(
            height: 35,
          ),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.lock_outlined,
              ),
              hintText: 'Password',
              hintStyle: TextStyle(color: Colors.grey),
            ),
            onChanged: presenter.validatePassword,
          ),
        ],
      ),
    );
  }
}
