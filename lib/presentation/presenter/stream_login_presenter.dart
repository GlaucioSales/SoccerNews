import 'dart:async';

import 'package:meta/meta.dart';

import '../protocols/protocols.dart';

class LoginState {
  String emailError;
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
  Stream<bool> get isFormValid =>
      _controller.stream.map((state) => state.isFormValid).distinct();



  void validateEmail(String email) {
    _state.emailError = validation.validate(field: 'email', value: email);
    _controller.add(_state);
  }

  void disposed() {
    _controller.close();
  }
}
