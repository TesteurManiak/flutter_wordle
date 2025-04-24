// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'letter_feedback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LetterFeedback _$LetterFeedbackFromJson(Map<String, dynamic> json) =>
    _LetterFeedback(
      letter: json['letter'] as String,
      color: const ColorConverter().fromJson((json['color'] as num).toInt()),
      isValid: json['isValid'] as bool,
    );

Map<String, dynamic> _$LetterFeedbackToJson(_LetterFeedback instance) =>
    <String, dynamic>{
      'letter': instance.letter,
      'color': const ColorConverter().toJson(instance.color),
      'isValid': instance.isValid,
    };
