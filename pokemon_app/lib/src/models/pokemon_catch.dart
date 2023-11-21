import 'package:floor/floor.dart';

@Entity(tableName: "pokemon_catch")
class PokemonCatch {
  @primaryKey
  int pokedexNumber;

  String nome = '';
  String tipo = '';
  String image = '';

  PokemonCatch(this.pokedexNumber, this.nome, this.tipo, this.image);

  factory PokemonCatch.fromMap(Map<String, dynamic> map) {
    return PokemonCatch(
      map['pokedexNumber'],
      map['nome'],
      map['tipo'],
      map['image'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'pokedexNumber': pokedexNumber,
      'nome': nome,
      'tipo': tipo,
      'image': image
    };
  }

  @override
  String toString() {
    return 'Capturados{Número: $pokedexNumber, nome: $nome, tipo: $tipo, image: $image}';
  }
}
