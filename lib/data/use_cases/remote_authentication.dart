import 'package:flutter/material.dart';

import '../../domain/errors/errors.dart';
import '../../domain/models/models.dart';
import '../../domain/use_cases/use_cases.dart';
import '../http/http.dart';
import '../use_cases/use_cases.dart';

class RemoteAuthentication implements Authentication {
  final HttpClient httpClient;
  final String url;

  RemoteAuthentication({
    @required this.httpClient,
    @required this.url,
  });

  @override
  Future<AccountModel> auth(AuthenticationParams params) async {
    final body = RemoteAuthenticationParams.fromDomain(params).toJson();
    try {
      final response = await httpClient.request(
        url: url,
        method: 'post',
        body: body,
      );
      return AccountModel.fromJson(response);
    } on HttpError catch (error) {
      throw error == HttpError.unauthorized
          ? DomainError.invalidCredentials
          : DomainError.unexpected;
    }
  }
}
