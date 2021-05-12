import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:soccer_news/presentation/presenter/presenter.dart';
import 'package:soccer_news/presentation/protocols/protocols.dart';

class MockValidation extends Mock implements Validation {}

void main() {
  MockValidation validation;
  StreamLoginPresenter sut;
  String email;
  String password;
  PostExpectation mockValidationCall(String field) => when(validation.validate(
      field: field ?? anyNamed('field'), value: anyNamed('value')));

  void mockValidation({String field, String value}) {
    mockValidationCall(field).thenReturn(value);
  }

  setUp(() {
    validation = MockValidation();
    sut = StreamLoginPresenter(validation: validation);
    email = faker.internet.disposableEmail();
    password = faker.internet.password();
    mockValidation();
  });

  test('Should call validation with correct email', () {
    sut.validateEmail(email);

    verify(validation.validate(field: 'email', value: email)).called(1);
  });

  test('Should emit email error if validation fails', () {
    mockValidation(value: 'error');

    sut.emailErrorStream.listen(expectAsync1((error)=> expect(error, 'error')));
    sut.isFormValid.listen(expectAsync1((isValid)=> expect(isValid, false)));

    sut.validateEmail(email);
    sut.validateEmail(email);
  });

  test('Should emit null if validation succeed', () {
    sut.emailErrorStream.listen(expectAsync1((error)=> expect(error, null)));
    sut.isFormValid.listen(expectAsync1((isValid)=> expect(isValid, false)));

    sut.validateEmail(email);
  });

  test('Should call validation with correct password', () {

    sut.validatePassword(password);

    verify(validation.validate(field: 'password', value: password)).called(1);
  });

  test('Should emit password error if validation fails', () {
    mockValidation(value: 'error');

    sut.passwordErrorStream.listen(expectAsync1((error)=> expect(error, 'error')));
    sut.isFormValid.listen(expectAsync1((isValid)=> expect(isValid, false)));

    sut.validatePassword(password);
  });

  test('Should emit password null if validation succeed', () {
    sut.emailErrorStream.listen(expectAsync1((error)=> expect(error, null)));

    sut.isFormValid.listen(expectAsync1((isValid)=> expect(isValid, false)));

    sut.validatePassword(password);
    sut.validatePassword(password);
  });
}
