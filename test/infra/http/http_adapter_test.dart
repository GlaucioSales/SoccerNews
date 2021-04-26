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
  setUp(() {
    client = ClientMock();
    sut = HttpAdapter(client);
    url = faker.internet.httpUrl();
  });

  group('post', () {
    test('Should call post with corrects values', () async {
      final Map<String, String> headers = {
        'content-type': 'application/json',
        'accept': 'application/json'
      };

      await sut.request(url: url, method: 'post');

      verify(client.post(HttpUrlParse.fromURL(url).toUri(), headers: headers));
    });
  });
}
