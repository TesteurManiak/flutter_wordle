import 'package:freezed_annotation/freezed_annotation.dart';

part 'word_of_the_day.freezed.dart';

@freezed
abstract class WordOfTheDay with _$WordOfTheDay {
  const factory WordOfTheDay({
    required String word,
    required String locale,
    required DateTime date,
  }) = _WordOfTheDay;

  const WordOfTheDay._();

  bool get isExpired {
    final now = DateTime.now();
    return !(date.year == now.year &&
        date.month == now.month &&
        date.day == now.day);
  }
}
