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

  PokemonModelDao? _pokemonModelDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `pokemon_model` (`pokedexNumber` INTEGER, `nome` TEXT, `tipo` TEXT, `altura` INTEGER, `peso` INTEGER, `vida` INTEGER, `atk` INTEGER, `def` INTEGER, `velAtk` INTEGER, `velDef` INTEGER, `vel` INTEGER, `total` INTEGER, `urlImagem` TEXT, PRIMARY KEY (`pokedexNumber`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  PokemonModelDao get pokemonModelDao {
    return _pokemonModelDaoInstance ??=
        _$PokemonModelDao(database, changeListener);
  }
}

class _$PokemonModelDao extends PokemonModelDao {
  _$PokemonModelDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _pokemonModelInsertionAdapter = InsertionAdapter(
            database,
            'pokemon_model',
            (PokemonModel item) => <String, Object?>{
                  'pokedexNumber': item.pokedexNumber,
                  'nome': item.nome,
                  'tipo': item.tipo,
                  'altura': item.altura,
                  'peso': item.peso,
                  'vida': item.vida,
                  'atk': item.atk,
                  'def': item.def,
                  'velAtk': item.velAtk,
                  'velDef': item.velDef,
                  'vel': item.vel,
                  'total': item.total,
                  'urlImagem': item.urlImagem
                }),
        _pokemonModelUpdateAdapter = UpdateAdapter(
            database,
            'pokemon_model',
            ['pokedexNumber'],
            (PokemonModel item) => <String, Object?>{
                  'pokedexNumber': item.pokedexNumber,
                  'nome': item.nome,
                  'tipo': item.tipo,
                  'altura': item.altura,
                  'peso': item.peso,
                  'vida': item.vida,
                  'atk': item.atk,
                  'def': item.def,
                  'velAtk': item.velAtk,
                  'velDef': item.velDef,
                  'vel': item.vel,
                  'total': item.total,
                  'urlImagem': item.urlImagem
                }),
        _pokemonModelDeletionAdapter = DeletionAdapter(
            database,
            'pokemon_model',
            ['pokedexNumber'],
            (PokemonModel item) => <String, Object?>{
                  'pokedexNumber': item.pokedexNumber,
                  'nome': item.nome,
                  'tipo': item.tipo,
                  'altura': item.altura,
                  'peso': item.peso,
                  'vida': item.vida,
                  'atk': item.atk,
                  'def': item.def,
                  'velAtk': item.velAtk,
                  'velDef': item.velDef,
                  'vel': item.vel,
                  'total': item.total,
                  'urlImagem': item.urlImagem
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<PokemonModel> _pokemonModelInsertionAdapter;

  final UpdateAdapter<PokemonModel> _pokemonModelUpdateAdapter;

  final DeletionAdapter<PokemonModel> _pokemonModelDeletionAdapter;

  @override
  Future<List<PokemonModel>> findAllPokemon() async {
    return _queryAdapter.queryList('SELECT * FROM pokemon_model',
        mapper: (Map<String, Object?> row) => PokemonModel(
            pokedexNumber: row['pokedexNumber'] as int?,
            nome: row['nome'] as String?,
            tipo: row['tipo'] as String?,
            altura: row['altura'] as int?,
            peso: row['peso'] as int?,
            vida: row['vida'] as int?,
            atk: row['atk'] as int?,
            def: row['def'] as int?,
            velAtk: row['velAtk'] as int?,
            velDef: row['velDef'] as int?,
            vel: row['vel'] as int?,
            total: row['total'] as int?,
            urlImagem: row['urlImagem'] as String?));
  }

  @override
  Future<PokemonModel?> findPokemonById(int pokedexNumber) async {
    return _queryAdapter.query(
        'SELECT * FROM pokemon_model WHERE pokedexNumber = ?1',
        mapper: (Map<String, Object?> row) => PokemonModel(
            pokedexNumber: row['pokedexNumber'] as int?,
            nome: row['nome'] as String?,
            tipo: row['tipo'] as String?,
            altura: row['altura'] as int?,
            peso: row['peso'] as int?,
            vida: row['vida'] as int?,
            atk: row['atk'] as int?,
            def: row['def'] as int?,
            velAtk: row['velAtk'] as int?,
            velDef: row['velDef'] as int?,
            vel: row['vel'] as int?,
            total: row['total'] as int?,
            urlImagem: row['urlImagem'] as String?),
        arguments: [pokedexNumber]);
  }

  @override
  Future<void> insertPokemon(PokemonModel pokemonModel) async {
    await _pokemonModelInsertionAdapter.insert(
        pokemonModel, OnConflictStrategy.abort);
  }

  @override
  Future<int> updatePokemon(PokemonModel pokemonModel) {
    return _pokemonModelUpdateAdapter.updateAndReturnChangedRows(
        pokemonModel, OnConflictStrategy.abort);
  }

  @override
  Future<void> deletePokemon(PokemonModel pokemonModel) async {
    await _pokemonModelDeletionAdapter.delete(pokemonModel);
  }
}
