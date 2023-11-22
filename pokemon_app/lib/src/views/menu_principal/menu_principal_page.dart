// 2 button centralizados
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/src/views/pokedex/pokedex_page.dart';
import 'package:pokemon_app/src/views/pokemon_capturados/pokemons_capturados_page.dart';


class Menu extends StatelessWidget {
  const Menu({super.key});

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
          body: const MenuPage()),
    );
  }
}

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          "https://logodownload.org/wp-content/uploads/2017/08/pokemon-logo.png",
          height: 200,
          width: MediaQuery.of(context).size.width * 0.7,
          fit: BoxFit.scaleDown,
        ),
        Image.network(
          "https://static.wikia.nocookie.net/pokepediabr/images/3/38/Pok%C3%A9dex_Kanto.png/revision/latest?cb=20131224014121&path-prefix=pt-br",
          height: 300,
          width: MediaQuery.of(context).size.width * 0.7,
          fit: BoxFit.contain,
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PokedexListPage()));
            },
            child: const Text("Lista de Pokemons")),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PokemonCatchPage()));
            },
            child: const Text('Pokemons Capturados')),       
      ],
    ));
  }
}
