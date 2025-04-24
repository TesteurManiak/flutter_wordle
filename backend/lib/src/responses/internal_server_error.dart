import 'package:backend/src/http_status_code.dart';
import 'package:backend/src/responses/error_response.dart';

class InternalServerError extends ErrorResponse {
  InternalServerError(String error)
      : super(
          statusCode: HttpStatusCode.internalServerError.code,
          message: 'Internal server error: $error',
        );
}
