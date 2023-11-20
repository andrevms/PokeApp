// 2 button centralizados
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/src/views/pokedex/pokedex_page.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            title:const Text(
              "Pokedex App",                                        
            ),
            centerTitle: true,
            titleTextStyle: Theme.of(context).textTheme.labelLarge,
          ),
          body:const MenuPage()),
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
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const PokedexListPage()));
            },
            child: const Text("Lista de Pokemons")),
        ElevatedButton(onPressed: () {}, child: const Text('Pokemons Capturados')),
      ],
    ));
  }
}
