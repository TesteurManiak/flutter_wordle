import 'dart:io';

import 'package:backend/src/database/drift_database.dart';
import 'package:drift/drift.dart';

class BackendMigrationStrategy extends MigrationStrategy {
  BackendMigrationStrategy(this.db);

  final BackendDatabase db;

  @override
  OnCreate get onCreate => _onCreate;

  Future<void> _onCreate(Migrator m) async {
    // Pre-populate the database with words
    final enAsset = File('assets/en.txt');
    final enWords = await enAsset.readAsLines();

    await m.createAll();
    await db.batch(
      (b) => b.insertAll(
        db.wordsTable,
        enWords.map((w) => WordsTableCompanion.insert(word: w, locale: 'en')),
      ),
    );
  }
}
