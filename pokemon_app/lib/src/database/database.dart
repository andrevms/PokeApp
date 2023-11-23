
import 'dart:async';

import 'package:floor/floor.dart';
import 'package:pokemon_app/src/models/pokemon_model.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:pokemon_app/src/dao/pokemon_model_dao.dart';

part 'database.g.dart';

@Database(version: 1, entities: [PokemonModel])
abstract class PokemonDatabase extends FloorDatabase {
  PokemonModelDao get pokemonModelDao;
}