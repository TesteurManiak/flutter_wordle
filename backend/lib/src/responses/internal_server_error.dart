import 'dart:io';

import 'package:backend/src/responses/error_response.dart';

class InternalServerError extends ErrorResponse {
  InternalServerError(String error)
      : super(
          statusCode: HttpStatus.internalServerError,
          message: 'Internal server error: $error',
        );
}
