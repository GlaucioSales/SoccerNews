import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:soccer_news/data/http/http_url_parse.dart';
import 'package:test/test.dart';

class ClientMock extends Mock implements Client {}

main() {
  group('post', () {
    test('Should call post with corrects values', () async {
      final String url = faker.internet.httpUrl();
      final client = ClientMock();
      final sut = HttpAdapter(client);

      await sut.request(url: url, method: 'post');

      verify(client.post(Uri.parse(url)));
    });
  });

  test('Should call post with corrects values', () async {
    final String url = faker.internet.httpUrl();
    final client = ClientMock();
    final sut = HttpAdapter(client);

    await sut.request(url: url, method: 'post');

    verify(client.post(Uri.parse(url)));
  });
});
}

class HttpAdapter {
  final Client client;

  HttpAdapter(this.client);

  Future<void> request({
    @required String url,
    @required String method,
  }) async {
    await client.post(HttpUrlParse.fromURL(url).toUri());
  }
}
