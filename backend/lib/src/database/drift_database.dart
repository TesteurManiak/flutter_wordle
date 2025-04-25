import 'package:backend/src/database/migration.dart';
import 'package:backend/src/env_variables.dart';
import 'package:drift/drift.dart';
import 'package:drift_postgres/drift_postgres.dart';
import 'package:postgres/postgres.dart' as pg;

part 'drift_database.g.dart';

class WordsTable extends Table {
  TextColumn get word => text().withLength(min: 5, max: 5)();
  TextColumn get locale => text()();

  @override
  Set<Column<Object>> get primaryKey => {word, locale};
}

class WordOfTheDayTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get word => text().withLength(min: 5, max: 5)();
  TextColumn get locale => text()();
  DateTimeColumn get date => dateTime()();
}

@DriftDatabase(tables: [WordsTable, WordOfTheDayTable])
class BackendDatabase extends _$BackendDatabase {
  BackendDatabase() : super(_openConnection());

  @override
  MigrationStrategy get migration => BackendMigrationStrategy(this);

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return PgDatabase(
      endpoint: pg.Endpoint(
        host: EnvVariables.pgHost,
        database: 'myapp',
        username: EnvVariables.pgUser,
        password: EnvVariables.pgPassword,
      ),
      settings: pg.ConnectionSettings(
        sslMode: EnvVariables.devModeEnabled
            ? pg.SslMode.disable
            : pg.SslMode.require,
      ),
    );
  }
}
