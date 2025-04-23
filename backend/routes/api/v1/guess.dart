import 'package:backend/src/data_sources/words_data_source.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  // Get the word of the day from the database
  final dataSource = context.read<WordsDataSource>();
  // Return a random word from the database
  return Response(body: 'acorn');
}
