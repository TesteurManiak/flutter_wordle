import 'package:backend/src/http_status_code.dart';
import 'package:backend/src/responses/error_response.dart';

class BadRequestResponse extends ErrorResponse {
  BadRequestResponse({required String error})
      : super(statusCode: HttpStatusCode.badRequest.code, message: error);
}
