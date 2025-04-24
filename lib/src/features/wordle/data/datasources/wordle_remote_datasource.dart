import 'package:flutter_wordle/src/common/env_variables.dart';
import 'package:flutter_wordle/src/common/http_clients.dart/api_client.dart';
import 'package:flutter_wordle/src/common/http_clients.dart/rest_client.dart';
import 'package:flutter_wordle/src/common/locator.dart';
import 'package:http/http.dart';

final randomWordApiClient = Locator(
  create: () => ApiClient(restClient: RestClient(baseUri: Uri.parse(EnvVariables.apiDomain), httpClient: Client())),
);

final wordleRemoteDatasource = Locator(
  create: () => WordleRemoteDatasource(randomWordApiClient: randomWordApiClient.instance),
);

class WordleRemoteDatasource {
  const WordleRemoteDatasource({required ApiClient randomWordApiClient}) : _randomWordApiClient = randomWordApiClient;

  final ApiClient _randomWordApiClient;

  Future<String> getWord() async {
    final result = await _randomWordApiClient.get('/api/v1/random', queryParameters: {'locale': 'en'});
    return switch (result) {
      RequestError(:final error) => throw error,
      RequestSuccessString(:final data) => data,
      RequestSuccessJson(:final data) => data['word'] as String,
      RequestSuccessList(:final data) => data.first,
    };
  }
}
