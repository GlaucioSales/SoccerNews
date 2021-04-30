import 'package:flutter/material.dart';

import '../pages/login/login.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Color.fromRGBO(136, 14, 79, 1);
    final Color primaryColorDark = Color.fromRGBO(96, 0, 39, 1);
    final Color primaryColorLight = Color.fromRGBO(188, 71, 123, 1);
    final Color accentColor = Color.fromRGBO(136, 14, 79, 1);
    final Color backgroundColor = Color.fromRGBO(255, 255, 255, 1);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      theme: ThemeData(
        primaryColor: primaryColor,
        primaryColorDark: primaryColorDark,
        primaryColorLight: primaryColorLight,
        accentColor: accentColor,
        backgroundColor: backgroundColor,
      ),
    );
  }
}
