import '../../domain/entities/entities.dart';
import '../http/http.dart';

class RemoteAccountModel {
  final String token;

  RemoteAccountModel(this.token);

  factory RemoteAccountModel.fromJson(Map<String, dynamic> json) {
    if (!json.containsKey('token')) {
      throw HttpError.invalidData;
    }

    return RemoteAccountModel(json['token']);
  }

  AccountEntity toEntity() => AccountEntity(token);
}
