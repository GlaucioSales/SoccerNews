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
    PostExpectation _mockRequest() => when(
        client.post(any, body: anyNamed('body'), headers: anyNamed('headers')));
    void _mockResponse(int statusCode,
        {String body = '{"any_arguments":"any_value"}'}) {
      _mockRequest().thenAnswer((_) async => Response(body, statusCode));
    }

    setUp(() {
      _mockResponse(200);
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
      final response = await sut.request(url: url, method: 'post');

      expect(response, {'any_arguments': 'any_value'});
    });

    test('Should return null if post returns 200', () async {
      _mockResponse(200, body: '');

      final response = await sut.request(url: url, method: 'post');

      expect(response, null);
    });
  });
}
