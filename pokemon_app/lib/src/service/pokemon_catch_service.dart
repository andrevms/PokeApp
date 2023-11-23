import 'dart:math';

import 'package:dio/dio.dart';
import 'package:pokemon_app/src/models/pokemon_model.dart';

class PokemonCatch{
  Future<List<PokemonModel>> pegarPokemons()async{

     var pokemonApi = (await Dio()
            .get('https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0'))
        .data['results'];
    
    List<PokemonModel> listaPokemons = await pokemonToList(pokemonApi); 
    
    return listaPokemons;
  }

  Future<List<PokemonModel>> pokemonToList(json) async {
    //lita de Futures
    List<Future> apiListaPokemons = [];
    //lista de pokemons
    List<PokemonModel> listaPokemons = [];
    //gerar número aleatório até 1150
    int valor = Random().nextInt(1150);

    for (var x = valor; x < valor + 21; x++) {
      apiListaPokemons.add(Dio().get(json[x]["url"]).then((value) {
        listaPokemons.add(PokemonModel().toModel(value));
      }));
    }
    
    await Future.wait(apiListaPokemons);
    return listaPokemons;
  }
}