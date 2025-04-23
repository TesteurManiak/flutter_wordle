import 'package:backend/src/models/letter_feedback.dart';
import 'package:backend/src/models/word.dart';

abstract interface class WordsDataSource {
  Future<List<LetterFeedback>> checkWordOfTheDay({
    required String guess,
    required String locale,
  });

  Future<Word> getRandomWord(String locale);
}
