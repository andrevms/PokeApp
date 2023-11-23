import 'package:floor/floor.dart';
import 'package:pokemon_app/src/models/pokemon_model.dart';

@dao
abstract class PokemonModelDao {
  @Query('SELECT * FROM pokemon_model')
  Future<List<PokemonModel>> findAllPokemon();

  @Query('SELECT * FROM pokemon_model WHERE pokedexNumber = :pokedexNumber')
  Future<PokemonModel?> findPokemonById(int pokedexNumber);

  @insert
  Future<void> insertPokemon(PokemonModel pokemonModel);

  @delete
  Future<void> deletePokemon(PokemonModel pokemonModel);

  @update
  Future<int> updatePokemon(PokemonModel pokemonModel);
}
