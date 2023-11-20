// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorPokemonDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$PokemonDatabaseBuilder databaseBuilder(String name) =>
      _$PokemonDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$PokemonDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$PokemonDatabaseBuilder(null);
}

class _$PokemonDatabaseBuilder {
  _$PokemonDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$PokemonDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$PokemonDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<PokemonDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$PokemonDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$PokemonDatabase extends PokemonDatabase {
  _$PokemonDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  PokemonCatchDao? _pokemonCatchDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `pokemon_catch` (`pokedexNumber` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `nome` TEXT NOT NULL, `tipo` TEXT NOT NULL, `image` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  PokemonCatchDao get pokemonCatchDao {
    return _pokemonCatchDaoInstance ??=
        _$PokemonCatchDao(database, changeListener);
  }
}

class _$PokemonCatchDao extends PokemonCatchDao {
  _$PokemonCatchDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _pokemonCatchInsertionAdapter = InsertionAdapter(
            database,
            'pokemon_catch',
            (PokemonCatch item) => <String, Object?>{
                  'pokedexNumber': item.pokedexNumber,
                  'nome': item.nome,
                  'tipo': item.tipo,
                  'image': item.image
                },
            changeListener),
        _pokemonCatchUpdateAdapter = UpdateAdapter(
            database,
            'pokemon_catch',
            ['pokedexNumber'],
            (PokemonCatch item) => <String, Object?>{
                  'pokedexNumber': item.pokedexNumber,
                  'nome': item.nome,
                  'tipo': item.tipo,
                  'image': item.image
                },
            changeListener),
        _pokemonCatchDeletionAdapter = DeletionAdapter(
            database,
            'pokemon_catch',
            ['pokedexNumber'],
            (PokemonCatch item) => <String, Object?>{
                  'pokedexNumber': item.pokedexNumber,
                  'nome': item.nome,
                  'tipo': item.tipo,
                  'image': item.image
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<PokemonCatch> _pokemonCatchInsertionAdapter;

  final UpdateAdapter<PokemonCatch> _pokemonCatchUpdateAdapter;

  final DeletionAdapter<PokemonCatch> _pokemonCatchDeletionAdapter;

  @override
  Future<List<PokemonCatch>> findAllPokemon() async {
    return _queryAdapter.queryList('SELECT * FROM pokemon_catch',
        mapper: (Map<String, Object?> row) => PokemonCatch(
            row['pokedexNumber'] as int,
            row['nome'] as String,
            row['tipo'] as String,
            row['image'] as String));
  }

  @override
  Stream<PokemonCatch?> findPokemonCatchById(int pokedexNumber) {
    return _queryAdapter.queryStream(
        'SELECT * FROM pokemon_catch WHERE pokedexNumber = ?1',
        mapper: (Map<String, Object?> row) => PokemonCatch(
            row['pokedexNumber'] as int,
            row['nome'] as String,
            row['tipo'] as String,
            row['image'] as String),
        arguments: [pokedexNumber],
        queryableName: 'pokemon_catch',
        isView: false);
  }

  @override
  Future<void> insertPokemonCatch(PokemonCatch pokemonCatch) async {
    await _pokemonCatchInsertionAdapter.insert(
        pokemonCatch, OnConflictStrategy.abort);
  }

  @override
  Future<void> updatePokemonCatch(PokemonCatch pokemonCatch) async {
    await _pokemonCatchUpdateAdapter.update(
        pokemonCatch, OnConflictStrategy.abort);
  }

  @override
  Future<void> deletePokemonCatch(PokemonCatch pokemonCatch) async {
    await _pokemonCatchDeletionAdapter.delete(pokemonCatch);
  }
}
