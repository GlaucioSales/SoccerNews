import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../data/http/http.dart';

class HttpAdapter implements HttpClient {
  final Client client;

  HttpAdapter(this.client);

  @override
  Future<Map<String, dynamic>> request({
    @required String url,
    @required String method,
    Map<String, dynamic> body,
  }) async {
    final Map<String, String> headers = {
      'content-type': 'application/json',
      'accept': 'application/json'
    };
    final jsonBody = body != null ? jsonEncode(body) : null;
    final response = await client.post(
      HttpUrlParse.fromURL(url).toUri(),
      headers: headers,
      body: jsonBody,
    );
    return _handleResponse(response);
  }

  Map<String, dynamic> _handleResponse(Response response) {
    if (response.statusCode == 200) {
      return response.body.isNotEmpty ? jsonDecode(response.body) : null;
    } else if (response.statusCode == 204) {
      return null;
    } else if (response.statusCode == 400) {
      throw HttpError.badRequest;
    } else if (response.statusCode == 401) {
      throw HttpError.unauthorized;
    } else if (response.statusCode == 403) {
      throw HttpError.forbidden;
    } else if (response.statusCode == 404) {
      throw HttpError.notFound;
    } else {
      throw HttpError.serverError;
    }
  }
}
