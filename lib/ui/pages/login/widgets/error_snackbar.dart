import 'package:flutter/material.dart';

void showErrorMessage({
  @required BuildContext context,
  @required String error,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        error,
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.red,
    ),
  );
}
