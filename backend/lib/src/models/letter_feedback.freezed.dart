// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'letter_feedback.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LetterFeedback {
  String get letter;
  LetterStatus get color;

  /// Create a copy of LetterFeedback
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LetterFeedbackCopyWith<LetterFeedback> get copyWith =>
      _$LetterFeedbackCopyWithImpl<LetterFeedback>(
          this as LetterFeedback, _$identity);

  /// Serializes this LetterFeedback to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LetterFeedback &&
            (identical(other.letter, letter) || other.letter == letter) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, letter, color);

  @override
  String toString() {
    return 'LetterFeedback(letter: $letter, color: $color)';
  }
}

/// @nodoc
abstract mixin class $LetterFeedbackCopyWith<$Res> {
  factory $LetterFeedbackCopyWith(
          LetterFeedback value, $Res Function(LetterFeedback) _then) =
      _$LetterFeedbackCopyWithImpl;
  @useResult
  $Res call({String letter, LetterStatus color});
}

/// @nodoc
class _$LetterFeedbackCopyWithImpl<$Res>
    implements $LetterFeedbackCopyWith<$Res> {
  _$LetterFeedbackCopyWithImpl(this._self, this._then);

  final LetterFeedback _self;
  final $Res Function(LetterFeedback) _then;

  /// Create a copy of LetterFeedback
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? letter = null,
    Object? color = null,
  }) {
    return _then(_self.copyWith(
      letter: null == letter
          ? _self.letter
          : letter // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _self.color
          : color // ignore: cast_nullable_to_non_nullable
              as LetterStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _LetterFeedback implements LetterFeedback {
  const _LetterFeedback({required this.letter, required this.color});
  factory _LetterFeedback.fromJson(Map<String, dynamic> json) =>
      _$LetterFeedbackFromJson(json);

  @override
  final String letter;
  @override
  final LetterStatus color;

  /// Create a copy of LetterFeedback
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LetterFeedbackCopyWith<_LetterFeedback> get copyWith =>
      __$LetterFeedbackCopyWithImpl<_LetterFeedback>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LetterFeedbackToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LetterFeedback &&
            (identical(other.letter, letter) || other.letter == letter) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, letter, color);

  @override
  String toString() {
    return 'LetterFeedback(letter: $letter, color: $color)';
  }
}

/// @nodoc
abstract mixin class _$LetterFeedbackCopyWith<$Res>
    implements $LetterFeedbackCopyWith<$Res> {
  factory _$LetterFeedbackCopyWith(
          _LetterFeedback value, $Res Function(_LetterFeedback) _then) =
      __$LetterFeedbackCopyWithImpl;
  @override
  @useResult
  $Res call({String letter, LetterStatus color});
}

/// @nodoc
class __$LetterFeedbackCopyWithImpl<$Res>
    implements _$LetterFeedbackCopyWith<$Res> {
  __$LetterFeedbackCopyWithImpl(this._self, this._then);

  final _LetterFeedback _self;
  final $Res Function(_LetterFeedback) _then;

  /// Create a copy of LetterFeedback
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? letter = null,
    Object? color = null,
  }) {
    return _then(_LetterFeedback(
      letter: null == letter
          ? _self.letter
          : letter // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _self.color
          : color // ignore: cast_nullable_to_non_nullable
              as LetterStatus,
    ));
  }
}

// dart format on
