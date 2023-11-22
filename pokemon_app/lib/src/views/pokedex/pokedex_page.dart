// Listagem dos pokemons vindos da api

// ListView
// Titulo --> Numero do pokemon
// Subtitulo -->  nome do pokemon

// Ao Clicar vai para a pagina do pokemon_detalhes
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/src/models/pokemon_model.dart';
import 'package:pokemon_app/src/views/pokemon_detalhes/pokemon_detalhes_page.dart';

class PokedexListPage extends StatelessWidget {
  const PokedexListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            title: const Text(
              "Pokedex App",
            ),
            centerTitle: true,
            titleTextStyle: Theme.of(context).textTheme.labelLarge,
          ),
          body: const ListPage()),
    );
  }
}

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  Future<List<PokemonModel>> pegarPokemons() async {
   
    //Retorna lista de pokemons
    var pokemonApi = (await Dio()
            .get('https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0'))
        .data['results'];

    var pokemonModel = PokemonModel();
    List<PokemonModel> listaPokemons = await pokemonModel.toList(pokemonApi);    
        
    return listaPokemons;
  }
  atualizar()async{
    setState(() {
      
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: pegarPokemons(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          List<PokemonModel> pokemons = snapshot.data!;

          // Calcula o número de linhas necessárias
          int numRows = (pokemons.length / 3).ceil();

          return RefreshIndicator(
            onRefresh: () => atualizar(),
            child: Container(
              color: Theme.of(context).colorScheme.primary,
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: ListView.builder(
                    itemCount: numRows,
                    itemBuilder: (BuildContext context, int rowIndex) {
                      int startIndex = rowIndex * 3;
                      int endIndex = (rowIndex + 1) * 3;
          
                      // Garante que endIndex não ultrapasse o comprimento da lista
                      endIndex =
                          endIndex > pokemons.length ? pokemons.length : endIndex;
          
                      // Cria uma lista de pokémons para a linha atual
                      List<PokemonModel> pokemonRow =
                          pokemons.sublist(startIndex, endIndex);
                      return Row(
                        children: pokemonRow.map((pokemon) {
                          return Expanded(
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PokemonDetalhesPage(
                                                    model: pokemon)));
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        children: [
                                          Image.network(
                                            pokemon.urlImagem!,
                                            scale: 5,
                                          ),
                                          Text(pokemon.nome!),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ),
              ),
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
