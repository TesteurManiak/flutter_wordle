import 'package:flutter_wordle/src/common/env_variables.dart';
import 'package:flutter_wordle/src/common/http_clients.dart/api_client.dart';
import 'package:flutter_wordle/src/common/http_clients.dart/rest_client.dart';
import 'package:flutter_wordle/src/common/locator.dart';
import 'package:flutter_wordle/src/features/wordle/data/models/letter_feedback.dart';
import 'package:flutter_wordle/src/features/wordle/data/models/word.dart';
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

  Future<String> getRandomWord() async {
    final result = await _randomWordApiClient
        .get('/api/v1/random', queryParameters: {'locale': 'en'})
        .decode(Word.fromJson);
    return switch (result) {
      ResultFailure(:final failure) => throw failure,
      ResultSuccess(success: final word) => word.word,
    };
  }

  Future<List<LetterFeedback>> guessWord(String guess) async {
    final result = await _randomWordApiClient
        .post('/api/v1/guess', body: Word(word: guess, locale: 'en').toJson())
        .decodeList(LetterFeedback.fromJson);
    return switch (result) {
      ResultFailure(:final failure) => throw failure,
      ResultSuccess(:final success) => success,
    };
  }
}
