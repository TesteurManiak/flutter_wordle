import 'dart:io';

import 'package:backend/src/responses/error_response.dart';

class BadRequestResponse extends ErrorResponse {
  BadRequestResponse({required String error})
      : super(statusCode: HttpStatus.badRequest, message: error);
}
