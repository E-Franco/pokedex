abstract class HttpClient {
  Future<HttpResponse> get(String url);
}

class HttpResponse {
  HttpResponse({
    required this.data,
    required this.statusCode,
  });

  final dynamic data;
  final int statusCode;
}
