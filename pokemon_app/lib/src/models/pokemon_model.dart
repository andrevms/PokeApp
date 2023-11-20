import 'dart:math';

import 'package:dio/dio.dart';
import 'package:floor/floor.dart';

@entity
class PokemonModel {
  @primaryKey
  final int? pokedexNumber;

  final String? nome;
  final String? tipo;
  final int? altura;
  final int? peso;
  final int? vida;
  final int? atk;
  final int? def;
  final int? velAtk;
  final int? velDef;
  final int? vel;
  final int? total;
  final String? urlImagem;

  PokemonModel(
      {this.pokedexNumber,
      this.nome,
      this.tipo,
      this.altura,
      this.peso,
      this.vida,
      this.atk,
      this.def,
      this.velAtk,
      this.velDef,
      this.vel,
      this.total,
      this.urlImagem});

  PokemonModel toModel(api) {
    //lista de tipos
    List<String> listaTipos = [];
    var json = api.data;
    //soma dos valores totais
    int valorTotal = (json['stats'][1]['base_stat']) +
        json['stats'][2]['base_stat'] +
        json['stats'][3]['base_stat'] +
        json['stats'][4]['base_stat'] +
        json['stats'][5]['base_stat'];

    //percorrendo tipos
    for (int x = 0; x < json["types"].length; x++) {
      listaTipos.add(json["types"][x]['type']['name']);
    }

    return PokemonModel(
        pokedexNumber: json['id'],
        nome: json['name'],
        tipo: listaTipos.toString(),
        altura: json['height'],
        peso: json['weight'],
        vida: json['stats'][0]['base_stat'],
        atk: json['stats'][1]['base_stat'],
        def: json['stats'][2]['base_stat'],
        velAtk: json['stats'][3]['base_stat'],
        velDef: json['stats'][4]['base_stat'],
        vel: json['stats'][5]['base_stat'],
        total: valorTotal,
        urlImagem: json['sprites']['other']['official-artwork']
            ['front_default']);
  }

  Future<List<PokemonModel>> toList(json) async {
    List<Future> apiListaPokemons = [];
    List<PokemonModel> listaPokemons = [];
    int valor = Random().nextInt(1150);

    for (var x = valor; x < valor+50; x++) {
      apiListaPokemons.add(Dio().get(json[x]["url"]).then((value) {
        listaPokemons.add(toModel(value));
      }));
    }
    await Future.wait(apiListaPokemons);
    return listaPokemons;
  }
}
