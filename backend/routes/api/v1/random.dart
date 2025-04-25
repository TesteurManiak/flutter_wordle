import 'package:backend/src/data_sources/words_data_source.dart';
import 'package:backend/src/responses/internal_server_error.dart';
import 'package:backend/src/responses/method_not_allowed.dart';
import 'package:dart_frog/dart_frog.dart';

const _kDefaultLocale = 'en';

/// @Allow(GET)
/// @Query(locale)
Future<Response> onRequest(RequestContext context) {
  final method = context.request.method;
  return switch (method) {
    HttpMethod.get => _get(context),
    _ => Future.value(MethodNotAllowedResponse(method)),
  };
}

Future<Response> _get(RequestContext context) async {
  try {
    final dataSource = context.read<WordsDataSource>();
    final locale =
        context.request.uri.queryParameters['locale'] ?? _kDefaultLocale;
    final word = await dataSource.getRandomWord(locale);
    return Response.json(body: word.toJson());
  } catch (e) {
    return InternalServerError('$e');
  }
}
