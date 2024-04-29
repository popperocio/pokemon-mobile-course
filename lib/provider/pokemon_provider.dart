import 'package:flutter/material.dart';
import 'package:pokemon_mobile_course/model/pokemon_model.dart';
import 'package:pokemon_mobile_course/services/pokemon_services.dart';


class PokemonProvider extends ChangeNotifier {
  PokemonProvider() {
    print('PokemonProvider initialized');
    getInitialPokemons();
  }

  int pokemonId = 1;

  void getInitialPokemons() async {
    for (int i = 1; i <= 10; i++) {
      final pokemon = await PokemonServices.getPokemon(i);

      _pokemons.add(pokemon);
      pokemonId++;
    }

    notifyListeners();
  }

  set pokemonIdCounter(int value) {
    pokemonId = value;
  }

  final List<Pokemon> _pokemons = [];

  void addPokemon(id) async {
    final pokemon = await PokemonServices.getPokemon(id);

    _pokemons.add(pokemon);

    notifyListeners();
  }

  List<Pokemon> get pokemons => _pokemons;
}
