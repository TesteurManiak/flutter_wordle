import 'package:dart_frog/dart_frog.dart';

class ErrorResponse extends Response {
  ErrorResponse({
    required super.statusCode,
    required String message,
  }) : super(body: message);
}
