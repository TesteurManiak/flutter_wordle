import 'dart:io';

import 'package:backend/src/responses/error_response.dart';
import 'package:dart_frog/dart_frog.dart';

class MethodNotAllowedResponse extends ErrorResponse {
  MethodNotAllowedResponse(HttpMethod method)
      : super(
          statusCode: HttpStatus.methodNotAllowed,
          message: 'Method ${method.value} not allowed',
        );
}
