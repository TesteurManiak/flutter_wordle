import 'package:backend/src/data_sources/local_words_data_source.dart';
import 'package:backend/src/data_sources/words_data_source.dart';
import 'package:backend/src/database/drift_database.dart';
import 'package:dart_frog/dart_frog.dart';

final _db = BackendDatabase();

Handler middleware(Handler handler) {
  return handler
    ..use(provider<BackendDatabase>((_) => _db))
    ..use(
      provider<WordsDataSource>((ctxt) => LocalWordsDataSource(ctxt.read())),
    );
}
