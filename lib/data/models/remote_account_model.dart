import '../../domain/entities/entities.dart';

class RemoteAccountModel {
  final String token;

  RemoteAccountModel(this.token);

  factory RemoteAccountModel.fromJson(Map<String, dynamic> json) {
    return RemoteAccountModel(json['token']);
  }

  AccountEntity toEntity() => AccountEntity(token);
}
