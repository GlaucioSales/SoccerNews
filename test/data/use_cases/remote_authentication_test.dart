import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:soccer_news/data/http/http.dart';
import 'package:soccer_news/data/use_cases/use_cases.dart';
import 'package:soccer_news/domain/errors/errors.dart';
import 'package:soccer_news/domain/use_cases/use_cases.dart';
import 'package:test/test.dart';

class HttpClientMock extends Mock implements HttpClient {}

void main() {
  RemoteAuthentication _sut;
  HttpClient _httpClient;
  String _url;
  AuthenticationParams _params;

  PostExpectation _mockRequest() {
    return when(_httpClient.request(
      url: anyNamed('url'),
      method: anyNamed('method'),
      body: anyNamed('body'),
    ));
  }

  void _mockHttpSuccess(Map<String, dynamic> map) {
    _mockRequest().thenAnswer((_) async => map);
  }

  void _mockHttpError(HttpError error) {
    _mockRequest().thenThrow(error);
  }

  setUp(() {
    _httpClient = HttpClientMock();
    _url = faker.internet.httpUrl();
    _sut = RemoteAuthentication(
      httpClient: _httpClient,
      url: _url,
    );
    _params = AuthenticationParams(
      email: faker.internet.email(),
      secret: faker.internet.password(),
    );
  });

  test("Should call HttpClient with correct values", () async {
    _mockHttpSuccess({
      'name': faker.internet.userName(),
      'token': faker.guid.guid(),
    });

    await _sut.auth(_params);

    verify(_httpClient.request(
      url: _url,
      method: 'post',
      body: {
        'email': _params.email,
        'password': _params.secret,
      },
    ));
  });

  test("Should throw UnexpectedError if HttpClient return 400", () async {
    _mockHttpError(HttpError.badRequest);

    final future = _sut.auth(_params);

    expect(future, throwsA(DomainError.unexpected));
  });

  test("Should throw UnexpectedError if HttpClient return 404", () async {
    _mockHttpError(HttpError.notFound);

    final future = _sut.auth(_params);

    expect(future, throwsA(DomainError.unexpected));
  });

  test("Should throw UnexpectedError if HttpClient return 500", () async {
    _mockHttpError(HttpError.serverError);

    final future = _sut.auth(_params);

    expect(future, throwsA(DomainError.unexpected));
  });

  test("Should throw InvalidCredentialError if HttpClient return 401",
      () async {
    _mockHttpError(HttpError.unauthorized);

    final future = _sut.auth(_params);

    expect(future, throwsA(DomainError.invalidCredentials));
  });

  test("Should return an Account if HttpClient return 200", () async {
    final String accountToken = faker.guid.guid();

    _mockHttpSuccess({
      'name': faker.internet.userName(),
      'token': accountToken,
    });

    final account = await _sut.auth(_params);

    expect(account.token, accountToken);
  });

  test(
      "Should throw UnexpectedError if HttpClient return 200 with incorrect data",
      () async {
    _mockHttpSuccess({
      'invalid_argument': 'invalid_value',
    });

    final future = _sut.auth(_params);

    expect(future, throwsA(DomainError.unexpected));
  });
}
