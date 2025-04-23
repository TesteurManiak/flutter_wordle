import 'package:backend/src/status_code.dart';
import 'package:dart_frog/dart_frog.dart';

class MethodNotAllowedResponse extends Response {
  MethodNotAllowedResponse(this.method)
      : super(
          statusCode: StatusCode.methodNotAllowed.code,
          body: 'Method ${method.value} not allowed',
        );

  final HttpMethod method;
}
