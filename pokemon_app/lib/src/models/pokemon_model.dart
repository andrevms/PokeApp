import 'package:floor/floor.dart';

@entity
class PokemonModel {
  @primaryKey
  final int pokedexNumber;

  final String nome;
  final String tipo;
  final double altura;
  final double peso;
  final int vida;
  final int atk;
  final int def;
  final double velAtk;
  final double velDef;
  final double vel;
  final double total;

  PokemonModel(
      {required this.pokedexNumber,
      required this.nome,
      required this.tipo,
      required this.altura,
      required this.peso,
      required this.vida,
      required this.atk,
      required this.def,
      required this.velAtk,
      required this.velDef,
      required this.vel,
      required this.total});
}
