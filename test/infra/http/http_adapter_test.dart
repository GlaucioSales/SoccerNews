import 'package:faker/faker.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:soccer_news/data/http/http.dart';
import 'package:soccer_news/infra/http/infra.dart';
import 'package:test/test.dart';

class ClientMock extends Mock implements Client {}

main() {
  ClientMock client;
  HttpAdapter sut;
  String url;
  Map<String, String> headers;
  setUp(() {
    client = ClientMock();
    sut = HttpAdapter(client);
    url = faker.internet.httpUrl();
    headers = {
      'content-type': 'application/json',
      'accept': 'application/json'
    };
  });

  group('post', () {
    test('Should call post with corrects values', () async {
      await sut.request(url: url, method: 'post');

      verify(client.post(HttpUrlParse.fromURL(url).toUri(), headers: headers));
    });

    test('Should call post with correct body', () async {
      final Map<String, dynamic> body = {
        'any_arguments': 'any_value',
      };

      await sut.request(url: url, method: 'post', body: body);

      verify(client.post(HttpUrlParse.fromURL(url).toUri(),
          headers: headers, body: '{"any_arguments":"any_value"}'));
    });

    test('Should call post without body', () async {
      await sut.request(url: url, method: 'post');

      verify(client.post(HttpUrlParse.fromURL(url).toUri(), headers: headers));
    });

    test('Should return data if post returns 200', () async {
      when(client.post(any, headers: headers)).thenAnswer(
          (_) async => Response('{"any_arguments":"any_value"}', 200));

      final response = await sut.request(url: url, method: 'post');

      expect(response, {'any_arguments': 'any_value'});
    });
  });
}
