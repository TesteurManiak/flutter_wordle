import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

enum HttpMethod {
  get('GET'),
  post('POST'),
  delete('DELETE'),
  put('PUT'),
  patch('PATCH');

  const HttpMethod(this.method);

  final String method;
}

class RestClient {
  RestClient({required this.baseUri, required this.httpClient});

  final Uri baseUri;
  final Client httpClient;

  Future<RequestResult> send({
    required HttpMethod method,
    required String path,
    Map<String, Object?>? queryParameters,
  }) async {
    try {
      final uri = baseUri.replace(path: path, queryParameters: queryParameters);
      final request = Request(method.method, uri);

      final response = await httpClient.send(request);
      if (!response.isSuccessful) {
        throw Exception('Request failed with status: ${response.statusCode}');
      }

      return RequestResult._parse(response.stream);
    } catch (e) {
      return RequestResult.error(e);
    }
  }
}

extension on StreamedResponse {
  bool get isSuccessful => statusCode >= 200 && statusCode < 300;
}

sealed class RequestResult {
  const RequestResult._();

  Object get data;

  const factory RequestResult.error(Object error) = RequestError;
  const factory RequestResult.successString(String data) = RequestSuccessString;
  const factory RequestResult.successJson(Map<String, dynamic> data) = RequestSuccessJson;
  const factory RequestResult.successList(List data) = RequestSuccessList;

  static Future<RequestResult> _parse(ByteStream bytes) async {
    final response = await bytes.bytesToString();
    try {
      final json = await compute<String, dynamic>(jsonDecode, response);

      return switch (json) {
        final Map<String, dynamic> map => RequestResult.successJson(map),
        final Iterable list => RequestResult.successList(list.toList()),
        final e => RequestResult.successString(e.toString()),
      };
    } on FormatException {
      return RequestResult.successString(response);
    } catch (e) {
      return RequestResult.error(e);
    }
  }
}

class RequestError extends RequestResult {
  const RequestError(this.error) : super._();

  final Object error;

  @override
  Object get data => error;
}

class RequestSuccessString extends RequestResult {
  const RequestSuccessString(this.data) : super._();

  @override
  final String data;
}

class RequestSuccessJson extends RequestResult {
  const RequestSuccessJson(this.data) : super._();

  @override
  final Map<String, dynamic> data;
}

class RequestSuccessList extends RequestResult {
  const RequestSuccessList(this.data) : super._();

  @override
  final List data;
}
