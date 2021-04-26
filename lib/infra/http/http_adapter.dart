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
    final jsonResponse = response != null ? jsonDecode(response.body) : null;
    return jsonResponse;
  }
}
