import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'letter_feedback.freezed.dart';
part 'letter_feedback.g.dart';

@freezed
abstract class LetterFeedback with _$LetterFeedback {
  const factory LetterFeedback({
    required String letter,
    @ColorConverter() required Color color,
    required bool isValid,
  }) = _LetterFeedback;

  const LetterFeedback._();

  factory LetterFeedback.fromJson(Map<String, dynamic> json) => _$LetterFeedbackFromJson(json);
}

class ColorConverter implements JsonConverter<Color, int> {
  const ColorConverter();

  @override
  Color fromJson(int json) => Color(json);

  @override
  int toJson(Color color) => throw UnimplementedError('Color.toJson() is not implemented');
}
