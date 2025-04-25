import 'package:freezed_annotation/freezed_annotation.dart';

part 'error.freezed.dart';
part 'error.g.dart';

@freezed
abstract class AppError with _$AppError implements Exception {
  const AppError._();

  const factory AppError({int? code, required String message}) = NetworkError;

  factory AppError.fromJson(Map<String, dynamic> json) => _$AppErrorFromJson(json);

  @override
  String toString() => message;
}
