import 'package:backend/src/http_status_code.dart';
import 'package:backend/src/responses/error_response.dart';
import 'package:dart_frog/dart_frog.dart';

class MethodNotAllowedResponse extends ErrorResponse {
  MethodNotAllowedResponse(HttpMethod method)
      : super(
          statusCode: HttpStatusCode.methodNotAllowed.code,
          message: 'Method ${method.value} not allowed',
        );
}
