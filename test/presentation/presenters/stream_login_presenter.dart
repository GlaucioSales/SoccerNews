import 'dart:async';

import 'package:faker/faker.dart';
import 'package:meta/meta.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class StreamLoginPresenter {
  final Validation validation;

  final StreamController<LoginState> _controller =
      StreamController<LoginState>.broadcast();

  var _state = LoginState();

  Stream<String> get emailErrorStream =>
      _controller.stream.map((state) => state.emailError);

  StreamLoginPresenter({@required this.validation});

  void validateEmail(String email) {
    _state.emailError = validation.validate(field: 'email', value: email);
    _controller.add(_state);
  }

  void disposed() {
    _controller.close();
  }
}

class LoginState {
  String emailError;
}

abstract class Validation {
  String validate({String field, String value});
}

class MockValidation extends Mock implements Validation {}

void main() {
  MockValidation validation;
  StreamLoginPresenter sut;
  String email;

  setUp(() {
    validation = MockValidation();
    sut = StreamLoginPresenter(validation: validation);

    email = faker.internet.disposableEmail();
  });

  test('Should call validation with correct email', () {
    sut.validateEmail(email);

    verify(validation.validate(field: 'email', value: email)).called(1);
  });

  test('Should emit email error if validation fails', () {
    when(
      validation.validate(field: anyNamed('field'), value: anyNamed('value')),
    ).thenReturn('error');

    expectLater(sut.emailErrorStream, emits('error'));

    sut.validateEmail(email);
  });
}
