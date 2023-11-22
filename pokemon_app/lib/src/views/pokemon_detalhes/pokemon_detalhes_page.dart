// tem as informações do model

import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pokemon_app/src/database/database.dart';
import 'package:pokemon_app/src/models/pokemon_model.dart';

class PokemonDetalhesPage extends StatelessWidget {
  final PokemonModel model;
  PokemonDetalhesPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    List<String> listTipo =
        model.tipo!.replaceAll('[', '').replaceAll(']', '').split(', ');
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: pokemonDetailAppBar(),
        backgroundColor: corByTipoPokemon(listTipo[0]),
        body: bodyApp(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height, model, listTipo));
  }

  Color corByTipoPokemon(var tipo) {
    switch (tipo) {
      case "normal":
        return const Color(0xFFAAA67F);
      case "fighting":
        return const Color(0xFFC12239);
      case "flying":
        return const Color(0xFFA891EC);
      case "ground":
        return const Color(0xFFDEC16B);
      case "poison":
        return const Color(0xFFA43E9E);
      case "rock":
        return const Color(0xFFB69E31);
      case "bug":
        return const Color(0xFFA7B723);
      case "ghost":
        return const Color(0xFF70559B);
      case "steel":
        return const Color(0xFFB7B9D0);
      case "fire":
        return const Color(0xFFF57D31);
      case "water":
        return const Color(0xFF6493EB);
      case "grass":
        return const Color(0xFF74CB48);
      case "electric":
        return const Color(0xFFF9CF30);
      case "psychic":
        return const Color(0xFFFB5584);
      case "ice":
        return const Color(0xFF9AD6DF);
      case "dragon":
        return const Color(0xFF7037FF);
      case "dark":
        return const Color(0xFF75574C);
      case "fairy":
        return const Color(0xFFE69EAC);
      default:
        return const Color(0xFF666666);
    }
  }

  AppBar pokemonDetailAppBar() {
    return AppBar(
      title: Row(children: [
        Expanded(
          child: Text(
            model.nome.toString(),
            style: const TextStyle(fontSize: 24.0),
          ),
        ),
        Expanded(
          child: Text(
            model.pokedexNumber.toString(),
            textAlign: TextAlign.right,
            style: const TextStyle(fontSize: 24.0),
          ),
        )
      ]),
      leading: const BackButton(),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  Widget bodyApp(var mediaWidth, var mediaHeight, PokemonModel model,
      List<String> listTipo) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
            flex: 4,
            child: Container(alignment: Alignment.bottomCenter),
          ),
          Expanded(
            flex: 7,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0)),
              margin: const EdgeInsets.fromLTRB(5, 0, 5, 5),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 60,
                    child: Wrap(
                      direction: Axis.vertical,
                      children: listTipo.map(
                        (tipo) {
                          return Center(
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                              decoration: BoxDecoration(
                                color: corByTipoPokemon(tipo), // Cor de fundo
                                borderRadius: BorderRadius.circular(
                                    10.0), // Borda arredondada
                              ),
                              child: Text(
                                tipo,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                  SizedBox(
                    child: pokemonAbout(model, listTipo),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    child: Text(
                      'Base Stats',
                      style: TextStyle(
                        color: corByTipoPokemon(listTipo[0]),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        pokemonBaseStats("HP", model.vida!, model, listTipo),
                        pokemonBaseStats("ATK", model.atk!, model, listTipo),
                        pokemonBaseStats("DEF", model.def!, model, listTipo),
                        pokemonBaseStats(
                            "SATK", model.velAtk!, model, listTipo),
                        pokemonBaseStats(
                            "SDEF", model.velDef!, model, listTipo),
                        pokemonBaseStats("SPD", model.vel!, model, listTipo),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
        pokemonImage(mediaWidth, mediaHeight),
        capturePokemon(model, listTipo),
      ],
    );
  }

  Widget capturePokemon(PokemonModel model, List<String> listTipo) {
    return Positioned(
      bottom: 20,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: corByTipoPokemon(listTipo[0])),
        onPressed: () async {
          var data = await $FloorPokemonDatabase
              .databaseBuilder('pokemons_database.db')
              .build();

          PokemonModel? dataPokemon =
              await data.pokemonModelDao.findPokemonById(model.pokedexNumber!);

          if (dataPokemon == null) {
            

            data.pokemonModelDao.insertPokemon(model);
            showToast(
              "Parabéns !!! Você Capturou Esse pokemon!",
              duration: Duration(seconds: 2),
              position: ToastPosition.bottom,
              backgroundColor: corByTipoPokemon(listTipo[0]).withOpacity(0.8),
              radius: 13.0,
              textStyle: TextStyle(fontSize: 18.0, color: Colors.white),
            );
          } else {
            showToast(
              "Você já possui esse pokemon",
              duration: Duration(seconds: 2),
              position: ToastPosition.bottom,
              backgroundColor: corByTipoPokemon(listTipo[0]).withOpacity(0.8),
              radius: 13.0,
              textStyle: TextStyle(fontSize: 18.0, color: Colors.white),
            );
          }
        },
        child: Container(
          width: 30,
          height: 30,
          child: Image(
            image: AssetImage("assets/pokebola.png"),
          ),
        ),
      ),
    );
  }

  Widget pokemonBaseStats(
      String atributo, int val, PokemonModel model, List<String> listTipo) {
    return SizedBox(
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            atributo,
            textAlign: TextAlign.right,
          ),
          const Text(
            "|",
            style: TextStyle(
                fontSize: 45, fontWeight: FontWeight.w100, color: Colors.grey),
          ),
          Text(
            val.toString(),
            textAlign: TextAlign.right,
          ),
          pokemonStatwidget(val, listTipo),
        ],
      ),
    );
  }

  Widget pokemonStatwidget(int val, List<String> listTipo) {
    double valEmDouble = val / 100.0;
    if (valEmDouble > 1) {
      valEmDouble = 1;
    }
    Color cor = corByTipoPokemon(listTipo[0]);
    return LinearPercentIndicator(
      barRadius: const Radius.circular(18.0),
      width: 200.0,
      lineHeight: 14.0,
      percent: valEmDouble,
      backgroundColor: Colors.grey,
      progressColor: cor,
    );
  }

  Widget pokemonAbout(PokemonModel model, List<String> listTipo) {
    return Column(
      children: [
        Text(
          'About',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            color: corByTipoPokemon(listTipo[0]),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(10, 5, 5, 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.fitness_center_sharp,
                        size: 15.0,
                      ),
                      const Text("    "),
                      Text(
                        '${model.peso.toString()} kg',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  const Text("Weight", style: TextStyle(fontSize: 12))
                ],
              ),
            ),
            const Text(
              "|",
              style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.w100,
                  color: Colors.grey),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 5, 5, 10),
              child: Column(children: [
                Row(
                  children: [
                    const Icon(Icons.height, size: 15.0),
                    const Text(" "),
                    Text('${model.altura.toString()} m',
                        style: const TextStyle(fontSize: 14)),
                  ],
                ),
                const Text("Height", style: TextStyle(fontSize: 12))
              ]),
            ),
          ],
        )
      ],
    );
  }

  Widget pokemonImage(var width, var height) {
    return Positioned(
      top: height * 0.15,
      child: Container(
        height: height * 0.3,
        width: width * 0.6,
        foregroundDecoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                model.urlImagem!,
              ),
              fit: BoxFit.fill),
        ),
      ),
    );
  }
}
