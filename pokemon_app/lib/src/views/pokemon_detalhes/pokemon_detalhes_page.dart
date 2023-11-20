// tem as informações do model

import 'package:flutter/material.dart';
import 'package:pokemon_app/src/models/pokemon_model.dart';

class PokemonDetalhesPage extends StatelessWidget {
  final PokemonModel model;
  PokemonDetalhesPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
  List<String> listTipo = model.tipo!.replaceAll('[', '').replaceAll(']', '').split(', ');
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: pokemonDetailAppBar(),
        backgroundColor: corByTipoPokemon(listTipo[0]),
        body: bodyApp(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height, model,listTipo));
  }

  Color corByTipoPokemon(var tipo) {
    switch (tipo) {
      case "Grass":
        return Color(0xFF74CB48);
      case "Poison":
        return Color(0xFFA43E9E);
      case "Ice":
        return Color(0xFF9AD6DF);
      default:
        return Colors.grey;
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

  Widget bodyApp(var mediaWidth, var mediaHeight, PokemonModel model, List<String> listTipo) {
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
                  const SizedBox(height: 20),
                  Expanded(
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
                  Expanded(
                    child: pokemonAbout(model,listTipo),
                  ),
                  Expanded(child: Text('teste')),
                  Expanded(child: Text('teste')),
                ],
              ),
            ),
          )
        ]),
        pokemonImage(mediaWidth, mediaHeight)
      ],
    );
  }

  Widget pokemonAbout(PokemonModel model,List<String> listTipo) {
    return Container(
      child: Column(children: [
        Text(
          'About',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            color: corByTipoPokemon(listTipo[0]),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,          
          children: [            
            Container(
              padding: EdgeInsets.fromLTRB(10, 5, 5, 10),
              child: Column(                
                children: [
                Row(                  
                  children: [
                    const Icon(Icons.fitness_center_sharp, size: 15.0,),
                    const Text("    ")
                    ,
                    Text('${model.peso.toString()} kg', style: const TextStyle(fontSize: 14),),
                  ],
                ),
                const Text("Weight", style: TextStyle(fontSize: 12))
              ]),
            ),
            const Text("|",style: TextStyle(fontSize: 45, fontWeight: FontWeight.w100,color: Colors.grey),)
            ,
            Container(
              padding: const EdgeInsets.fromLTRB(10, 5, 5, 10),
              child: Column(children: [
                Row(
                  children: [
                    const Icon(Icons.height, size: 15.0),
                    const Text(" ")
                    ,
                    Text('${model.altura.toString()} m', style: const TextStyle(fontSize: 14)),
                  ],
                ),
                const Text("Height",style: TextStyle(fontSize: 12))
              ]),
            ),
          ],
        )
      ]),
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

/*Expanded(
                      flex: 1,
                      child: ListView.builder(
                          padding: const EdgeInsets.fromLTRB(5, 15, 5, 5),
                          scrollDirection: Axis.horizontal,
                          itemCount: model.tipo.length,
                          itemBuilder: (context, index) {
                            return Center(
                              child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 5, 8, 5),
                                  decoration: BoxDecoration(
                                    color: corByTipoPokemon(
                                        model.tipo[index]), // Cor de fundo
                                    borderRadius: BorderRadius.circular(
                                        10.0), // Borda arredondada
                                  ),
                                  child: Text(
                                    model.tipo[index],
                                    style: const TextStyle(color: Colors.white),
                                  )),
                            );
                          })),*/
