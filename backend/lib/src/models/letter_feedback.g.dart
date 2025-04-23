// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'letter_feedback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LetterFeedback _$LetterFeedbackFromJson(Map<String, dynamic> json) =>
    _LetterFeedback(
      letter: json['letter'] as String,
      color: $enumDecode(_$LetterStatusEnumMap, json['color']),
    );

Map<String, dynamic> _$LetterFeedbackToJson(_LetterFeedback instance) =>
    <String, dynamic>{
      'letter': instance.letter,
      'color': _$LetterStatusEnumMap[instance.color]!,
    };

const _$LetterStatusEnumMap = {
  LetterStatus.good: 4283215696,
  LetterStatus.wrongPlace: 4294961979,
  LetterStatus.absent: 4294198070,
};
