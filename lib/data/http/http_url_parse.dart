class HttpUrlParse {
  final String url;
  HttpUrlParse(this.url);

  factory HttpUrlParse.fromURL(String url) {
    return HttpUrlParse(url);
  }

  Uri toUri() => Uri.parse(url);
}
