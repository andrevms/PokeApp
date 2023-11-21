import 'package:floor/floor.dart';
import 'package:pokemon_app/src/models/pokemon_catch.dart';

@dao
abstract class PokemonCatchDao {
  @Query('SELECT * FROM pokemon_catch')
  Future<List<PokemonCatch>> findAllPokemon();

  @Query('SELECT * FROM pokemon_catch WHERE pokedexNumber = :pokedexNumber')
  Future<PokemonCatch?> findPokemonCatchById(int pokedexNumber);

  @insert
  Future<void> insertPokemonCatch(PokemonCatch pokemonCatch);

  @delete
  Future<void> deletePokemonCatch(PokemonCatch pokemonCatch);

  @update
  Future<void> updatePokemonCatch(PokemonCatch pokemonCatch);
}
