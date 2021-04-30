import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:soccer_news/ui/pages/login/login.dart';

class LoginPresenterMock extends Mock implements LoginPresenter{}

void main() {
  LoginPresenter presenter;

  Future<void> loadPage (WidgetTester tester) async {
    presenter = LoginPresenterMock();
    MaterialApp loginPage = MaterialApp(home: LoginPage(presenter));
    await tester.pumpWidget(loginPage);
  }

  testWidgets('Should load with correct initial state', (WidgetTester tester) async {
    await loadPage(tester);

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
        passwordTextChildren,
        findsOneWidget,
        reason: 'when a TextFormField has only a Text child, means it has no errors, since one of childs is always the label text'
    );

    ElevatedButton button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    expect(button.onPressed, null);
  });

  testWidgets('Should call validate with correct values', (WidgetTester tester) async {
    await loadPage(tester);

    final String email = faker.internet.email();
    await tester.enterText(find.bySemanticsLabel('Email address'), email);
    verify(presenter.validateEmail(email));

    final String password = faker.internet.password();
    await tester.enterText(find.bySemanticsLabel('Password'), password);
    verify(presenter.validatePassword(password));

  });
}
