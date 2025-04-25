import 'package:dart_frog/dart_frog.dart';

class ErrorResponse extends Response {
  ErrorResponse({
    required super.statusCode,
    required String message,
  }) : super.json(
          body: {
            'code': statusCode,
            'message': message,
          },
        );
}
