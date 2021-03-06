import 'package:flutter/material.dart';
import 'package:soccer_news/ui/pages/login/login.dart';

class SignInLogin extends StatelessWidget {
  final LoginPresenter presenter;

  SignInLogin(this.presenter);

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
        StreamBuilder<bool>(
            stream: presenter.isFormValidStream,
            builder: (context, snapshot) {
              return ElevatedButton(
                child: StreamBuilder<Object>(
                    stream: presenter.isLoadingStream,
                    builder: (context, snapshot) {
                      final bool isLoading = snapshot.data;
                      return isLoading == true
                          ? CircularProgressIndicator()
                          : Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: Colors.white,
                            );
                    }),
                onPressed: snapshot.data == true ? presenter.auth : null,
              );
            }),
      ],
    );
  }
}
