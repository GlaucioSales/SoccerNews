import '../models/models.dart';
import '../use_cases/use_cases.dart';

abstract class Authentication {
  Future<AccountModel> auth(AuthenticationParams params);
}
