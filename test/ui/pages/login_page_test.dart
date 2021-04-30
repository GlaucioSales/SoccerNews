import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:soccer_news/ui/pages/login/login.dart';

void main() {
  MaterialApp loginPage;

  setUp((){
    loginPage = MaterialApp(home: LoginPage());
  });

  testWidgets('Should load with correct initial state', (WidgetTester tester) async {
    await tester.pumpWidget(loginPage);

    final emailTextChildren = find.descendant(
        of: find.bySemanticsLabel('Email address'),
        matching: find.byType(Text),
    );
    final passwordTextChildren = find.descendant(
      of: find.bySemanticsLabel('Password'),
      matching: find.byType(Text),
    );
    
    expect(
        emailTextChildren,
        findsOneWidget,
        reason: 'when a TextFormField has only a Text child, means it has no errors, since one of childs is always the label text'
    );

    expect(
        emailTextChildren,
        findsOneWidget,
        reason: 'when a TextFormField has only a Text child, means it has no errors, since one of childs is always the label text'
    );

    InkWell button = tester.widget<InkWell>(find.byType(InkWell));
    expect(button.onTap, null);
  });
}
