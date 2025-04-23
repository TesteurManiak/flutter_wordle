// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// ignore_for_file: type=lint
class $WordsTableTable extends WordsTable
    with TableInfo<$WordsTableTable, WordsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WordsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _wordMeta = const VerificationMeta('word');
  @override
  late final GeneratedColumn<String> word = GeneratedColumn<String>(
      'word', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 5, maxTextLength: 5),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _localeMeta = const VerificationMeta('locale');
  @override
  late final GeneratedColumn<String> locale = GeneratedColumn<String>(
      'locale', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [word, locale];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'words_table';
  @override
  VerificationContext validateIntegrity(Insertable<WordsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('word')) {
      context.handle(
          _wordMeta, word.isAcceptableOrUnknown(data['word']!, _wordMeta));
    } else if (isInserting) {
      context.missing(_wordMeta);
    }
    if (data.containsKey('locale')) {
      context.handle(_localeMeta,
          locale.isAcceptableOrUnknown(data['locale']!, _localeMeta));
    } else if (isInserting) {
      context.missing(_localeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {word, locale};
  @override
  WordsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WordsTableData(
      word: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}word'])!,
      locale: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}locale'])!,
    );
  }

  @override
  $WordsTableTable createAlias(String alias) {
    return $WordsTableTable(attachedDatabase, alias);
  }
}

class WordsTableData extends DataClass implements Insertable<WordsTableData> {
  final String word;
  final String locale;
  const WordsTableData({required this.word, required this.locale});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['word'] = Variable<String>(word);
    map['locale'] = Variable<String>(locale);
    return map;
  }

  WordsTableCompanion toCompanion(bool nullToAbsent) {
    return WordsTableCompanion(
      word: Value(word),
      locale: Value(locale),
    );
  }

  factory WordsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WordsTableData(
      word: serializer.fromJson<String>(json['word']),
      locale: serializer.fromJson<String>(json['locale']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'word': serializer.toJson<String>(word),
      'locale': serializer.toJson<String>(locale),
    };
  }

  WordsTableData copyWith({String? word, String? locale}) => WordsTableData(
        word: word ?? this.word,
        locale: locale ?? this.locale,
      );
  WordsTableData copyWithCompanion(WordsTableCompanion data) {
    return WordsTableData(
      word: data.word.present ? data.word.value : this.word,
      locale: data.locale.present ? data.locale.value : this.locale,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WordsTableData(')
          ..write('word: $word, ')
          ..write('locale: $locale')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(word, locale);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WordsTableData &&
          other.word == this.word &&
          other.locale == this.locale);
}

class WordsTableCompanion extends UpdateCompanion<WordsTableData> {
  final Value<String> word;
  final Value<String> locale;
  final Value<int> rowid;
  const WordsTableCompanion({
    this.word = const Value.absent(),
    this.locale = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WordsTableCompanion.insert({
    required String word,
    required String locale,
    this.rowid = const Value.absent(),
  })  : word = Value(word),
        locale = Value(locale);
  static Insertable<WordsTableData> custom({
    Expression<String>? word,
    Expression<String>? locale,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (word != null) 'word': word,
      if (locale != null) 'locale': locale,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WordsTableCompanion copyWith(
      {Value<String>? word, Value<String>? locale, Value<int>? rowid}) {
    return WordsTableCompanion(
      word: word ?? this.word,
      locale: locale ?? this.locale,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (word.present) {
      map['word'] = Variable<String>(word.value);
    }
    if (locale.present) {
      map['locale'] = Variable<String>(locale.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WordsTableCompanion(')
          ..write('word: $word, ')
          ..write('locale: $locale, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WordOfTheDayTableTable extends WordOfTheDayTable
    with TableInfo<$WordOfTheDayTableTable, WordOfTheDayTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WordOfTheDayTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _wordMeta = const VerificationMeta('word');
  @override
  late final GeneratedColumn<String> word = GeneratedColumn<String>(
      'word', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 5, maxTextLength: 5),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _localeMeta = const VerificationMeta('locale');
  @override
  late final GeneratedColumn<String> locale = GeneratedColumn<String>(
      'locale', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, word, locale, date];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'word_of_the_day_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<WordOfTheDayTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('word')) {
      context.handle(
          _wordMeta, word.isAcceptableOrUnknown(data['word']!, _wordMeta));
    } else if (isInserting) {
      context.missing(_wordMeta);
    }
    if (data.containsKey('locale')) {
      context.handle(_localeMeta,
          locale.isAcceptableOrUnknown(data['locale']!, _localeMeta));
    } else if (isInserting) {
      context.missing(_localeMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WordOfTheDayTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WordOfTheDayTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      word: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}word'])!,
      locale: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}locale'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
    );
  }

  @override
  $WordOfTheDayTableTable createAlias(String alias) {
    return $WordOfTheDayTableTable(attachedDatabase, alias);
  }
}

class WordOfTheDayTableData extends DataClass
    implements Insertable<WordOfTheDayTableData> {
  final int id;
  final String word;
  final String locale;
  final DateTime date;
  const WordOfTheDayTableData(
      {required this.id,
      required this.word,
      required this.locale,
      required this.date});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['word'] = Variable<String>(word);
    map['locale'] = Variable<String>(locale);
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  WordOfTheDayTableCompanion toCompanion(bool nullToAbsent) {
    return WordOfTheDayTableCompanion(
      id: Value(id),
      word: Value(word),
      locale: Value(locale),
      date: Value(date),
    );
  }

  factory WordOfTheDayTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WordOfTheDayTableData(
      id: serializer.fromJson<int>(json['id']),
      word: serializer.fromJson<String>(json['word']),
      locale: serializer.fromJson<String>(json['locale']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'word': serializer.toJson<String>(word),
      'locale': serializer.toJson<String>(locale),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  WordOfTheDayTableData copyWith(
          {int? id, String? word, String? locale, DateTime? date}) =>
      WordOfTheDayTableData(
        id: id ?? this.id,
        word: word ?? this.word,
        locale: locale ?? this.locale,
        date: date ?? this.date,
      );
  WordOfTheDayTableData copyWithCompanion(WordOfTheDayTableCompanion data) {
    return WordOfTheDayTableData(
      id: data.id.present ? data.id.value : this.id,
      word: data.word.present ? data.word.value : this.word,
      locale: data.locale.present ? data.locale.value : this.locale,
      date: data.date.present ? data.date.value : this.date,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WordOfTheDayTableData(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('locale: $locale, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, word, locale, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WordOfTheDayTableData &&
          other.id == this.id &&
          other.word == this.word &&
          other.locale == this.locale &&
          other.date == this.date);
}

class WordOfTheDayTableCompanion
    extends UpdateCompanion<WordOfTheDayTableData> {
  final Value<int> id;
  final Value<String> word;
  final Value<String> locale;
  final Value<DateTime> date;
  const WordOfTheDayTableCompanion({
    this.id = const Value.absent(),
    this.word = const Value.absent(),
    this.locale = const Value.absent(),
    this.date = const Value.absent(),
  });
  WordOfTheDayTableCompanion.insert({
    this.id = const Value.absent(),
    required String word,
    required String locale,
    required DateTime date,
  })  : word = Value(word),
        locale = Value(locale),
        date = Value(date);
  static Insertable<WordOfTheDayTableData> custom({
    Expression<int>? id,
    Expression<String>? word,
    Expression<String>? locale,
    Expression<DateTime>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (word != null) 'word': word,
      if (locale != null) 'locale': locale,
      if (date != null) 'date': date,
    });
  }

  WordOfTheDayTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? word,
      Value<String>? locale,
      Value<DateTime>? date}) {
    return WordOfTheDayTableCompanion(
      id: id ?? this.id,
      word: word ?? this.word,
      locale: locale ?? this.locale,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (word.present) {
      map['word'] = Variable<String>(word.value);
    }
    if (locale.present) {
      map['locale'] = Variable<String>(locale.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WordOfTheDayTableCompanion(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('locale: $locale, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

abstract class _$BackendDatabase extends GeneratedDatabase {
  _$BackendDatabase(QueryExecutor e) : super(e);
  $BackendDatabaseManager get managers => $BackendDatabaseManager(this);
  late final $WordsTableTable wordsTable = $WordsTableTable(this);
  late final $WordOfTheDayTableTable wordOfTheDayTable =
      $WordOfTheDayTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [wordsTable, wordOfTheDayTable];
}

typedef $$WordsTableTableCreateCompanionBuilder = WordsTableCompanion Function({
  required String word,
  required String locale,
  Value<int> rowid,
});
typedef $$WordsTableTableUpdateCompanionBuilder = WordsTableCompanion Function({
  Value<String> word,
  Value<String> locale,
  Value<int> rowid,
});

class $$WordsTableTableFilterComposer
    extends Composer<_$BackendDatabase, $WordsTableTable> {
  $$WordsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get word => $composableBuilder(
      column: $table.word, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get locale => $composableBuilder(
      column: $table.locale, builder: (column) => ColumnFilters(column));
}

class $$WordsTableTableOrderingComposer
    extends Composer<_$BackendDatabase, $WordsTableTable> {
  $$WordsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get word => $composableBuilder(
      column: $table.word, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get locale => $composableBuilder(
      column: $table.locale, builder: (column) => ColumnOrderings(column));
}

class $$WordsTableTableAnnotationComposer
    extends Composer<_$BackendDatabase, $WordsTableTable> {
  $$WordsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get word =>
      $composableBuilder(column: $table.word, builder: (column) => column);

  GeneratedColumn<String> get locale =>
      $composableBuilder(column: $table.locale, builder: (column) => column);
}

class $$WordsTableTableTableManager extends RootTableManager<
    _$BackendDatabase,
    $WordsTableTable,
    WordsTableData,
    $$WordsTableTableFilterComposer,
    $$WordsTableTableOrderingComposer,
    $$WordsTableTableAnnotationComposer,
    $$WordsTableTableCreateCompanionBuilder,
    $$WordsTableTableUpdateCompanionBuilder,
    (
      WordsTableData,
      BaseReferences<_$BackendDatabase, $WordsTableTable, WordsTableData>
    ),
    WordsTableData,
    PrefetchHooks Function()> {
  $$WordsTableTableTableManager(_$BackendDatabase db, $WordsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WordsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WordsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WordsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> word = const Value.absent(),
            Value<String> locale = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WordsTableCompanion(
            word: word,
            locale: locale,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String word,
            required String locale,
            Value<int> rowid = const Value.absent(),
          }) =>
              WordsTableCompanion.insert(
            word: word,
            locale: locale,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$WordsTableTableProcessedTableManager = ProcessedTableManager<
    _$BackendDatabase,
    $WordsTableTable,
    WordsTableData,
    $$WordsTableTableFilterComposer,
    $$WordsTableTableOrderingComposer,
    $$WordsTableTableAnnotationComposer,
    $$WordsTableTableCreateCompanionBuilder,
    $$WordsTableTableUpdateCompanionBuilder,
    (
      WordsTableData,
      BaseReferences<_$BackendDatabase, $WordsTableTable, WordsTableData>
    ),
    WordsTableData,
    PrefetchHooks Function()>;
typedef $$WordOfTheDayTableTableCreateCompanionBuilder
    = WordOfTheDayTableCompanion Function({
  Value<int> id,
  required String word,
  required String locale,
  required DateTime date,
});
typedef $$WordOfTheDayTableTableUpdateCompanionBuilder
    = WordOfTheDayTableCompanion Function({
  Value<int> id,
  Value<String> word,
  Value<String> locale,
  Value<DateTime> date,
});

class $$WordOfTheDayTableTableFilterComposer
    extends Composer<_$BackendDatabase, $WordOfTheDayTableTable> {
  $$WordOfTheDayTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get word => $composableBuilder(
      column: $table.word, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get locale => $composableBuilder(
      column: $table.locale, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));
}

class $$WordOfTheDayTableTableOrderingComposer
    extends Composer<_$BackendDatabase, $WordOfTheDayTableTable> {
  $$WordOfTheDayTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get word => $composableBuilder(
      column: $table.word, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get locale => $composableBuilder(
      column: $table.locale, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));
}

class $$WordOfTheDayTableTableAnnotationComposer
    extends Composer<_$BackendDatabase, $WordOfTheDayTableTable> {
  $$WordOfTheDayTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get word =>
      $composableBuilder(column: $table.word, builder: (column) => column);

  GeneratedColumn<String> get locale =>
      $composableBuilder(column: $table.locale, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);
}

class $$WordOfTheDayTableTableTableManager extends RootTableManager<
    _$BackendDatabase,
    $WordOfTheDayTableTable,
    WordOfTheDayTableData,
    $$WordOfTheDayTableTableFilterComposer,
    $$WordOfTheDayTableTableOrderingComposer,
    $$WordOfTheDayTableTableAnnotationComposer,
    $$WordOfTheDayTableTableCreateCompanionBuilder,
    $$WordOfTheDayTableTableUpdateCompanionBuilder,
    (
      WordOfTheDayTableData,
      BaseReferences<_$BackendDatabase, $WordOfTheDayTableTable,
          WordOfTheDayTableData>
    ),
    WordOfTheDayTableData,
    PrefetchHooks Function()> {
  $$WordOfTheDayTableTableTableManager(
      _$BackendDatabase db, $WordOfTheDayTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WordOfTheDayTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WordOfTheDayTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WordOfTheDayTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> word = const Value.absent(),
            Value<String> locale = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
          }) =>
              WordOfTheDayTableCompanion(
            id: id,
            word: word,
            locale: locale,
            date: date,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String word,
            required String locale,
            required DateTime date,
          }) =>
              WordOfTheDayTableCompanion.insert(
            id: id,
            word: word,
            locale: locale,
            date: date,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$WordOfTheDayTableTableProcessedTableManager = ProcessedTableManager<
    _$BackendDatabase,
    $WordOfTheDayTableTable,
    WordOfTheDayTableData,
    $$WordOfTheDayTableTableFilterComposer,
    $$WordOfTheDayTableTableOrderingComposer,
    $$WordOfTheDayTableTableAnnotationComposer,
    $$WordOfTheDayTableTableCreateCompanionBuilder,
    $$WordOfTheDayTableTableUpdateCompanionBuilder,
    (
      WordOfTheDayTableData,
      BaseReferences<_$BackendDatabase, $WordOfTheDayTableTable,
          WordOfTheDayTableData>
    ),
    WordOfTheDayTableData,
    PrefetchHooks Function()>;

class $BackendDatabaseManager {
  final _$BackendDatabase _db;
  $BackendDatabaseManager(this._db);
  $$WordsTableTableTableManager get wordsTable =>
      $$WordsTableTableTableManager(_db, _db.wordsTable);
  $$WordOfTheDayTableTableTableManager get wordOfTheDayTable =>
      $$WordOfTheDayTableTableTableManager(_db, _db.wordOfTheDayTable);
}
