import 'package:backend/src/data_sources/words_data_source.dart';
import 'package:backend/src/models/word.dart';
import 'package:backend/src/responses/method_not_allowed.dart';
import 'package:dart_frog/dart_frog.dart';

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
    final dataSource = context.read<WordsDataSource>();
    final result = await dataSource.checkWordOfTheDay(guess);
    return Response.json(body: result.map((e) => e.toJson()).toList());
  } catch (e, s) {
    return Response(statusCode: 500, body: '$e\n$s');
  }
}
