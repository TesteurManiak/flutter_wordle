import 'package:flutter_wordle/src/common/http_clients.dart/rest_client.dart';

class ApiClient {
  const ApiClient({required this.restClient});

  final RestClient restClient;

  Future<RequestResult> get(String path, {Map<String, Object?>? queryParameters}) {
    return restClient.send(method: HttpMethod.get, path: path, queryParameters: queryParameters);
  }
}
