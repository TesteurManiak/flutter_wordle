import 'package:freezed_annotation/freezed_annotation.dart';

part 'letter_feedback.freezed.dart';
part 'letter_feedback.g.dart';

@freezed
abstract class LetterFeedback with _$LetterFeedback {
  const factory LetterFeedback({
    required String letter,
    required LetterStatus color,
  }) = _LetterFeedback;

  factory LetterFeedback.fromJson(Map<String, dynamic> json) =>
      _$LetterFeedbackFromJson(json);
}

@JsonEnum(valueField: 'colorValue')
enum LetterStatus {
  good(0xFF4CAF50),
  wrongPlace(0xFFFFEB3B),
  absent(0xFFF44336);

  const LetterStatus(this.colorValue);

  final int colorValue;
}
