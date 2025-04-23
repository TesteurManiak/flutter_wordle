import 'package:backend/src/data_sources/words_data_source.dart';
import 'package:backend/src/database/drift_database.dart';
import 'package:backend/src/models/letter_feedback.dart';
import 'package:backend/src/models/word.dart';
import 'package:backend/src/models/word_of_the_day.dart';
import 'package:drift/drift.dart';

class LocalWordsDataSource implements WordsDataSource {
  LocalWordsDataSource(this._db);

  final BackendDatabase _db;

  @override
  Future<List<LetterFeedback>> checkWordOfTheDay(Word guess) async {
    final wordOfTheDay = await _getWordOfTheDay(guess.locale);
    return _checkLetters(guess.word, wordOfTheDay.word).toList();
  }

  Future<WordOfTheDay> _getWordOfTheDay(String locale) async {
    final query = _db.select(_db.wordOfTheDayTable)
      ..where((t) => t.locale.equals(locale));
    final wordOfTheDay = await query.map((d) => d.toEntity()).getSingleOrNull();

    if (wordOfTheDay == null || wordOfTheDay.isExpired) {
      final newWordOfTheDay = await getRandomWord(locale);
      await _db.batch((b) {
        b
          ..deleteWhere(_db.wordOfTheDayTable, (t) => t.locale.equals(locale))
          ..insert(_db.wordOfTheDayTable, newWordOfTheDay.insert());
      });
      return newWordOfTheDay.toWordOfTheDay();
    }

    return wordOfTheDay;
  }

  Iterable<LetterFeedback> _checkLetters(String guess, String secret) sync* {
    final secretLetters = secret.split('');
    final guessLetters = guess.split('');

    for (var i = 0; i < guessLetters.length; i++) {
      final guessLetter = guessLetters[i];
      if (guessLetters[i] == secretLetters[i]) {
        yield LetterFeedback(letter: guessLetter, color: LetterStatus.good);
      } else if (secretLetters.contains(guessLetter)) {
        yield LetterFeedback(
          letter: guessLetter,
          color: LetterStatus.wrongPlace,
        );
      } else {
        yield LetterFeedback(letter: guessLetter, color: LetterStatus.absent);
      }
    }
  }

  @override
  Future<Word> getRandomWord(String locale) {
    final query = _db.select(_db.wordsTable)
      ..where((t) => t.locale.equals(locale))
      ..orderBy([(t) => OrderingTerm.random()])
      ..limit(1);
    return query.map((e) => e.toEntity()).getSingle();
  }
}

extension on WordOfTheDayTableData {
  WordOfTheDay toEntity() {
    return WordOfTheDay(
      word: word,
      locale: locale,
      date: date,
    );
  }
}

extension on Word {
  WordOfTheDay toWordOfTheDay() {
    return WordOfTheDay(
      word: word,
      locale: locale,
      date: DateTime.now(),
    );
  }

  WordOfTheDayTableCompanion insert() {
    return WordOfTheDayTableCompanion.insert(
      word: word,
      locale: locale,
      date: DateTime.now(),
    );
  }
}

extension on WordsTableData {
  Word toEntity() {
    return Word(
      word: word,
      locale: locale,
    );
  }
}
