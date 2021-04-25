import 'package:flutter/material.dart';

import '../models/models.dart';

abstract class Authentication {
  Future<AccountModel> auth({
    @required String email,
    @required String password,
  });
}
