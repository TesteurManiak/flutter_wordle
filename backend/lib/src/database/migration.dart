import 'dart:convert';
import 'dart:io';

import 'package:backend/src/database/drift_database.dart';
import 'package:backend/src/models/word.dart';
import 'package:drift/drift.dart';

class BackendMigrationStrategy extends MigrationStrategy {
  BackendMigrationStrategy(this.db);

  final BackendDatabase db;

  @override
  OnCreate get onCreate => _onCreate;

  Future<void> _onCreate(Migrator m) async {
    // Pre-populate the database with words
    final enAsset = File('assets/words_en.json');
    final content = await enAsset.readAsString();
    final json = jsonDecode(content);
    final decodedJson = (json as Iterable)
        .cast<Map<String, dynamic>>()
        .map((e) => Word.fromJson(e).insert())
        .toList();

    await m.createAll();
    await db.batch((b) {
      b.insertAll(db.wordsTable, decodedJson);
    });
  }
}

extension on Word {
  WordsTableCompanion insert() {
    return WordsTableCompanion.insert(
      word: word,
      locale: locale,
    );
  }
}
