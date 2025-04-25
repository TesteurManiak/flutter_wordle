import 'package:backend/src/data_sources/words_data_source.dart';
import 'package:backend/src/logger/logger.dart';
import 'package:backend/src/models/word.dart';
import 'package:backend/src/responses/bad_request.dart';
import 'package:backend/src/responses/internal_server_error.dart';
import 'package:backend/src/responses/method_not_allowed.dart';
import 'package:dart_frog/dart_frog.dart';

/// @Allow(POST)
Future<Response> onRequest(RequestContext context) {
  final method = context.request.method;
  return switch (method) {
    HttpMethod.post => _post(context),
    _ => Future.value(MethodNotAllowedResponse(method)),
  };
}

Future<Response> _post(RequestContext context) async {
  try {
    final guess =
        Word.fromJson(await context.request.json() as Map<String, dynamic>);

    if (!guess.isValid) {
      return BadRequestResponse(
        error: 'Invalid word format. Expected a 5-letter word.',
      );
    }

    final dataSource = context.read<WordsDataSource>();
    final result = await dataSource.checkWordOfTheDay(guess);
    return Response.json(body: result.map((e) => e.toJson()).toList());
  } catch (e) {
    context.logger.error('$e');
    return InternalServerError('$e');
  }
}
