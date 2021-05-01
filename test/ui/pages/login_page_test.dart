import 'dart:async';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:soccer_news/ui/pages/login/login.dart';

class LoginPresenterMock extends Mock implements LoginPresenter{}

void main() {
  LoginPresenter presenter;
  StreamController<String> emailErrorController;
  StreamController<String> passwordErrorController;

  Future<void> loadPage (WidgetTester tester) async {
    presenter = LoginPresenterMock();
    emailErrorController = StreamController<String>();
    passwordErrorController = StreamController<String>();
    when(presenter.emailErrorController)
        .thenAnswer((realInvocation) => emailErrorController.stream);
    when(presenter.passwordErrorController)
        .thenAnswer((realInvocation) => passwordErrorController.stream);
    MaterialApp loginPage = MaterialApp(home: LoginPage(presenter));
    await tester.pumpWidget(loginPage);
  }

  tearDown((){
    emailErrorController.close();
    passwordErrorController.close();
  });


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

  testWidgets('Should present error if email is invalid', (WidgetTester tester) async {
    await loadPage(tester);
    emailErrorController.add('any error');

    await tester.pump();

    expect(find.text('any error'), findsOneWidget);
  });

  testWidgets('Should present no error if email is valid', (WidgetTester tester) async {
    await loadPage(tester);

    emailErrorController.add(null);
    await tester.pump();

    expect(
        find.descendant(
            of: find.bySemanticsLabel('Email address'),
            matching: find.byType(Text)
        ) ,
        findsOneWidget
    );
  });

  testWidgets('Should present no error if email is valid with controller void', (WidgetTester tester) async {
    await loadPage(tester);

    emailErrorController.add('');
    await tester.pump();

    expect(
        find.descendant(
            of: find.bySemanticsLabel('Email address'),
            matching: find.byType(Text)
        ) ,
        findsOneWidget
    );
  });

  testWidgets('Should present error if password is invalid', (WidgetTester tester) async {
    await loadPage(tester);
    passwordErrorController.add('any error');

    await tester.pump();

    expect(find.text('any error'), findsOneWidget);
  });

  testWidgets('Should present no error if password is valid', (WidgetTester tester) async {
    await loadPage(tester);
    passwordErrorController.add(null);

    await tester.pump();

    expect(
      find.descendant(
          of: find.bySemanticsLabel('Password'),
          matching: find.byType(Text)
      ),
      findsOneWidget
    );
  });

  testWidgets('Should present no error if password is valid with controller void', (WidgetTester tester) async {
    await loadPage(tester);
    passwordErrorController.add('');

    await tester.pump();

    expect(
        find.descendant(
            of: find.bySemanticsLabel('Password'),
            matching: find.byType(Text)
        ),
        findsOneWidget
    );
  });


}
