import 'package:flutter_wordle/src/common/http_clients.dart/api_client.dart';
import 'package:flutter_wordle/src/common/http_clients.dart/rest_client.dart';
import 'package:flutter_wordle/src/common/locator.dart';
import 'package:http/http.dart';

final randomWordApiClient = Locator(
  create:
      () => ApiClient(restClient: RestClient(baseUri: Uri.https('random-word-api.vercel.app'), httpClient: Client())),
);

final wordleRemoteDatasource = Locator(
  create: () => WordleRemoteDatasource(randomWordApiClient: randomWordApiClient.instance),
);

class WordleRemoteDatasource {
  const WordleRemoteDatasource({required ApiClient randomWordApiClient}) : _randomWordApiClient = randomWordApiClient;

  final ApiClient _randomWordApiClient;

  Future<String> getWord() async {
    final result = await _randomWordApiClient.get('/api', queryParameters: {'words': '1', 'length': '5'});
    return switch (result) {
      RequestError(:final error) => throw error,
      RequestSuccessString(:final data) => data,
      RequestSuccessJson(:final data) => throw FormatException('Unexpected JSON format: $data'),
      RequestSuccessList(:final data) => data.first,
    };
  }
}
