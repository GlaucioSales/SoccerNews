import 'package:flutter/material.dart';

class AuthenticationParams {
  final String email;
  final String secret;

  AuthenticationParams({
    @required this.email,
    @required this.secret,
  });

  Map<String, dynamic> toJson() => {'email': email, 'password': secret};
}
