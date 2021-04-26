import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../data/http/http.dart';

class HttpAdapter {
  final Client client;

  HttpAdapter(this.client);

  Future<void> request({
    @required String url,
    @required String method,
  }) async {
    final Map<String, String> headers = {
      'content-type': 'application/json',
      'accept': 'application/json'
    };
    await client.post(HttpUrlParse.fromURL(url).toUri(), headers: headers);
  }
}
