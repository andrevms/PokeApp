import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/src/dao/pokemon_catch_dao.dart';
import 'package:pokemon_app/src/database/database.dart';
import 'package:pokemon_app/src/models/pokemon_catch.dart';

class PokemonCatchPage extends StatelessWidget {
  const PokemonCatchPage({super.key});

  @override
    Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFFDC0A2D),
            title:const Text(
              "Pokedex App",                                        
            ),
            centerTitle: true,
            titleTextStyle: Theme.of(context).textTheme.labelLarge,
          ),
          body:const ListBody()),
    );
  }
}

class ListBody extends StatefulWidget {
  const ListBody({super.key});

  @override
  State<ListBody> createState() => _ListBodyState();
}

class _ListBodyState extends State<ListBody> {
  Future<PokemonDatabase>? db;

  @override
  void initState() {
    super.initState();
    db = initializaDatabase();
  }

  Future<PokemonDatabase> initializaDatabase() async {
    return $FloorPokemonDatabase.databaseBuilder('pokemons_database.db').build();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PokemonDatabase>(
      future: db,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return FutureBuilder<List<PokemonCatch>>(
            future: snapshot.data?.pokemonCatchDao.findAllPokemon() ??
                Future.value([]),
            builder: (context, snapshot) {
              final pokemonList = snapshot.data;

              return Container(
                color: const Color.fromARGB(255, 145, 19, 11),
                //borderRadius: BorderRadius.circular(50.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40.0),
                 // backgroundColor: Colors.red,//Theme.of(context).colorScheme.primary,
                  child: Container(
                    color:  const Color.fromARGB(255, 250, 247, 247),
                    margin: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, // 3 cards em cada linha
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                      ),
                      itemCount: pokemonList?.length ?? 0,
                      itemBuilder: (context, index) {
                        final pokemon = pokemonList![index];
                        return buildPokemonCard(context, pokemon);
                      },
                    ),
                  ),
                ),
              );
            },
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget buildPokemonCard(BuildContext context, PokemonCatch pokemon) {
    return GestureDetector(
      onTap: () {
        print("Foi clicado no pokemon: ${pokemon.nome}");
      },
      child: SingleChildScrollView(
        //padding: const EdgeInsets.all(10),
        child: Card(
          color: const Color.fromARGB(255, 228, 223, 223),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100, // Ajuste conforme necessário
                width: 100, // Ajuste conforme necessário
                child: Image.network(
                  pokemon.image,
                  fit: BoxFit.cover,
                ),
              ),
              //SizedBox(height: 1),
              Text(
                pokemon.nome,
                //textAlign: TextAlign.center,
                //style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
