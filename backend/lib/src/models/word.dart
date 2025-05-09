import 'package:freezed_annotation/freezed_annotation.dart';

part 'word.freezed.dart';
part 'word.g.dart';

@freezed
abstract class Word with _$Word {
  const factory Word({
    required String word,
    required String locale,
  }) = _Word;

  const Word._();

  factory Word.fromJson(Map<String, dynamic> json) => _$WordFromJson(json);

  bool get isValid => word.length == 5;
}
