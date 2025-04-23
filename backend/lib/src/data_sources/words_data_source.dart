import 'package:backend/src/models/letter_feedback.dart';
import 'package:backend/src/models/word.dart';

abstract interface class WordsDataSource {
  Future<List<LetterFeedback>> checkWordOfTheDay(Word guess);
  Future<Word> getRandomWord(String locale);
}
