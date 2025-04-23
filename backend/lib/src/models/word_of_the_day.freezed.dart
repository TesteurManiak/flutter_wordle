// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'word_of_the_day.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WordOfTheDay {
  String get word;
  String get locale;
  DateTime get date;

  /// Create a copy of WordOfTheDay
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WordOfTheDayCopyWith<WordOfTheDay> get copyWith =>
      _$WordOfTheDayCopyWithImpl<WordOfTheDay>(
          this as WordOfTheDay, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WordOfTheDay &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, word, locale, date);

  @override
  String toString() {
    return 'WordOfTheDay(word: $word, locale: $locale, date: $date)';
  }
}

/// @nodoc
abstract mixin class $WordOfTheDayCopyWith<$Res> {
  factory $WordOfTheDayCopyWith(
          WordOfTheDay value, $Res Function(WordOfTheDay) _then) =
      _$WordOfTheDayCopyWithImpl;
  @useResult
  $Res call({String word, String locale, DateTime date});
}

/// @nodoc
class _$WordOfTheDayCopyWithImpl<$Res> implements $WordOfTheDayCopyWith<$Res> {
  _$WordOfTheDayCopyWithImpl(this._self, this._then);

  final WordOfTheDay _self;
  final $Res Function(WordOfTheDay) _then;

  /// Create a copy of WordOfTheDay
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
    Object? locale = null,
    Object? date = null,
  }) {
    return _then(_self.copyWith(
      word: null == word
          ? _self.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      locale: null == locale
          ? _self.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _WordOfTheDay extends WordOfTheDay {
  const _WordOfTheDay(
      {required this.word, required this.locale, required this.date})
      : super._();

  @override
  final String word;
  @override
  final String locale;
  @override
  final DateTime date;

  /// Create a copy of WordOfTheDay
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WordOfTheDayCopyWith<_WordOfTheDay> get copyWith =>
      __$WordOfTheDayCopyWithImpl<_WordOfTheDay>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WordOfTheDay &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, word, locale, date);

  @override
  String toString() {
    return 'WordOfTheDay(word: $word, locale: $locale, date: $date)';
  }
}

/// @nodoc
abstract mixin class _$WordOfTheDayCopyWith<$Res>
    implements $WordOfTheDayCopyWith<$Res> {
  factory _$WordOfTheDayCopyWith(
          _WordOfTheDay value, $Res Function(_WordOfTheDay) _then) =
      __$WordOfTheDayCopyWithImpl;
  @override
  @useResult
  $Res call({String word, String locale, DateTime date});
}

/// @nodoc
class __$WordOfTheDayCopyWithImpl<$Res>
    implements _$WordOfTheDayCopyWith<$Res> {
  __$WordOfTheDayCopyWithImpl(this._self, this._then);

  final _WordOfTheDay _self;
  final $Res Function(_WordOfTheDay) _then;

  /// Create a copy of WordOfTheDay
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? word = null,
    Object? locale = null,
    Object? date = null,
  }) {
    return _then(_WordOfTheDay(
      word: null == word
          ? _self.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      locale: null == locale
          ? _self.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
