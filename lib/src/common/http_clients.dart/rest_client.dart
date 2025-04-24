import 'dart:convert';
import 'dart:io';

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

  Future<Result<Object, Object>> send({
    required HttpMethod method,
    required String path,
    Map<String, Object?>? queryParameters,
    Map<String, String>? headers,
    Object? body,
  }) {
    final uri = baseUri.replace(
      path: '${path.startsWith('/') ? '' : '/'}$path',
      queryParameters: queryParameters?.normalize(),
    );

    final request = Request(method.method, uri);
    if (headers != null) request.headers.addAll(headers);
    if (body != null) request.body = jsonEncode(body);

    return _sendRequest(request);
  }

  Future<Result<Object, Object>> _sendRequest(BaseRequest request) async {
    try {
      final response = await httpClient.send(request);

      if (!response.isSuccessful) {
        return Result.failure(Exception('Request failed with status: ${response.statusCode}'));
      }

      final body = await response.stream.bytesToString();
      if (body.isEmpty) return const Result.success('');

      final contentTypeHeader = response.headers[HttpHeaders.contentTypeHeader];
      if (contentTypeHeader != null) {
        final mimeType = ContentType.parse(contentTypeHeader).mimeType;
        if (mimeType == ContentType.json.mimeType) {
          final decodedJson = await compute(jsonDecode, body);
          if (decodedJson is! Object) {
            return const Result.failure(FormatException('Invalid JSON'));
          }
          return Result.success(decodedJson);
        }
      }

      return Result.success(body);
    } catch (e) {
      return Result.failure(e);
    }
  }
}

extension on StreamedResponse {
  bool get isSuccessful => statusCode >= 200 && statusCode < 300;
}

sealed class Result<S, F> {
  const Result._();

  const factory Result.success(S success) = ResultSuccess;
  const factory Result.failure(F failure) = ResultFailure;

  Result<TResult, F> whenSuccess<TResult>(TResult Function(S) onSuccess) {
    return switch (this) {
      ResultSuccess(:final success) => Result<TResult, F>.success(onSuccess(success)),
      ResultFailure(:final failure) => Result<TResult, F>.failure(failure),
    };
  }

  Result<T, F> decode<T>(T Function(Map<String, dynamic>) decoder) {
    return whenSuccess((success) {
      final Map<String, dynamic> json;
      if (success case final String s) {
        final decodedJson = jsonDecode(s);
        if (decodedJson is! Map<String, dynamic>) throw FormatException('Invalid JSON: $decodedJson');
        json = decodedJson;
      } else {
        if (success is! Map<String, dynamic>) throw FormatException('Invalid JSON: $success');
        json = success;
      }
      return decoder(json);
    });
  }

  Result<List<T>, F> decodeList<T>(T Function(Map<String, dynamic>) decoder) {
    return whenSuccess((success) {
      final List<Object?> json;
      if (success case final String s) {
        final decodedJson = jsonDecode(s);
        if (decodedJson is! List) throw FormatException('Invalid JSON: $decodedJson');
        json = decodedJson;
      } else {
        if (success is! List) throw FormatException('Invalid JSON: $success');
        json = success;
      }
      return json.cast<Map<String, dynamic>>().map((e) => decoder(e)).toList();
    });
  }
}

class ResultFailure<S, F> extends Result<S, F> {
  const ResultFailure(this.failure) : super._();

  final F failure;
}

class ResultSuccess<S, F> extends Result<S, F> {
  const ResultSuccess(this.success) : super._();

  final S success;
}

extension FutureResultDecoder<F> on Future<Result<Object?, F>> {
  Future<Result<S, F>> decode<S>(S Function(Map<String, dynamic>) decoder) async {
    return (await this).decode(decoder);
  }

  Future<Result<List<S>, F>> decodeList<S>(S Function(Map<String, dynamic>) decoder) async {
    return (await this).decodeList(decoder);
  }
}

extension on Map<String, Object?> {
  Map<String, Object>? normalize() {
    if (isEmpty) return null;

    final queryParams = <String, Object>{};

    for (final entry in entries) {
      final value = entry.value;
      if (value != null) {
        queryParams[entry.key] = value.toQueryParameter();
      }
    }

    if (queryParams.isEmpty) return null;

    return queryParams;
  }
}

extension on Object {
  Object toQueryParameter({bool root = true}) {
    return switch (this) {
      final String s => s,
      final Iterable<String> list when root => list,
      final Iterable<Object> list when root => list.map((e) => e.toQueryParameter(root: false)).toList(),
      final DateTime dt => dt.toIso8601String(),
      _ => toString(),
    };
  }
}
