import 'dart:async';

import '../protocols/protocols.dart';

class LoginState {
  String emailError;
  String passwordError;
  bool get isFormValid => false;
}

class StreamLoginPresenter {
  final Validation validation;
  var _state = LoginState();

  StreamLoginPresenter({this.validation});

  final StreamController<LoginState> _controller =
      StreamController<LoginState>.broadcast();

  Stream<String> get emailErrorStream =>
      _controller.stream.map((state) => state.emailError).distinct();
  Stream<String> get passwordErrorStream =>
      _controller.stream.map((state) => state.passwordError).distinct();

  Stream<bool> get isFormValid =>
      _controller.stream.map((state) => state.isFormValid).distinct();

  void update() => _controller.add(_state);

  void validateEmail(String email) {
    _state.emailError = validation.validate(field: 'email', value: email);
    update();
  }
  void validatePassword(String password) {
    _state.passwordError = validation.validate(field: 'password', value: password);
    update();
  }

  void disposed() {
    _controller.close();
  }
}
