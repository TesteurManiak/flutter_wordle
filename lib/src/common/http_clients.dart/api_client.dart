import 'package:flutter_wordle/src/common/http_clients.dart/rest_client.dart';

class ApiClient {
  const ApiClient({required this.restClient});

  final RestClient restClient;

  Future<Result<Object, Object>> get(
    String path, {
    Map<String, Object?>? queryParameters,
    Map<String, String>? headers,
  }) {
    return restClient.send(method: HttpMethod.get, path: path, queryParameters: queryParameters, headers: headers);
  }

  Future<Result<Object, Object>> post(
    String path, {
    Map<String, Object?>? queryParameters,
    Map<String, String>? headers,
    Object? body,
  }) {
    return restClient.send(
      method: HttpMethod.post,
      path: path,
      queryParameters: queryParameters,
      headers: headers,
      body: body,
    );
  }
}
