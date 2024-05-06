import 'package:flutter/material.dart';
import 'package:pokemon_mobile_course/provider/pokemon_provider.dart';
import 'package:pokemon_mobile_course/utils/permission_util.dart';
import 'package:pokemon_mobile_course/widgets/pokemon_card.dart';
import 'package:provider/provider.dart';

class PokemonListView extends StatefulWidget {
  const PokemonListView({super.key});

  @override
  State<PokemonListView> createState() => _PokemonListViewState();
}

class _PokemonListViewState extends State<PokemonListView> {
  @override
  void initState() {
    super.initState();
    askPermissions().then((value) => null);
  }

  @override
  Widget build(BuildContext context) {
    final pokemonProvider = Provider.of<PokemonProvider>(context);
    int pokemonIdCounter = pokemonProvider.pokemonId;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon List View'),
      ),
      body: (pokemonProvider.pokemons.isEmpty)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: pokemonProvider.pokemons.length,
              itemBuilder: (context, index) {
                return PokemonCard(
                  pokemon: pokemonProvider.pokemons[index],
                );
              },
            ),
      floatingActionButton: CustomFloatingActionButton(
          icon: Icons.add,
          onPressed: () {
            pokemonProvider.addPokemon(pokemonIdCounter);
            pokemonProvider.pokemonIdCounter = pokemonIdCounter + 1;
            setState(() {});
          }),
    );
  }
}

class CustomFloatingActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomFloatingActionButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      enableFeedback: true,
      elevation: 5,
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
