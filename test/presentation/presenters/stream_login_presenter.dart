import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class StreamLoginPresenter {
  final Validation validation;

  StreamLoginPresenter({@required this.validation});

  String validateEmail({
    @required String field,
    @required String value,
  }) {
    return validation.validate(
      field: field,
      value: value,
    );
  }
}

abstract class Validation {
  String validate({String field, String value});
}

class MockValidation extends Mock implements Validation {}

void main() {
  test('Should call validation with correct email', () {
    final validation = MockValidation();
    final sut = StreamLoginPresenter(validation: validation);

    String email = faker.internet.disposableEmail();

    sut.validateEmail(field: 'email', value: email);
    verify(validation.validate(field: 'email', value: email)).called(1);
  });
}
