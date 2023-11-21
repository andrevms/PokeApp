
import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:pokemon_app/src/dao/pokemon_catch_dao.dart';
import 'package:pokemon_app/src/models/pokemon_catch.dart';

part 'database.g.dart';

@Database(version: 1, entities: [PokemonCatch])
abstract class PokemonDatabase extends FloorDatabase {
  PokemonCatchDao get pokemonCatchDao;
}