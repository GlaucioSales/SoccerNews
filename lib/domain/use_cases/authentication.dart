import '../entities/entities.dart';
import '../use_cases/use_cases.dart';

abstract class Authentication {
  Future<AccountEntity> auth(AuthenticationParams params);
}
