import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:pokemon_mobile_course/model/pokemon_captures_model.dart';
import 'package:pokemon_mobile_course/model/pokemon_model.dart';
import 'package:pokemon_mobile_course/services/pokemon_services.dart';
import 'package:pokemon_mobile_course/utils/file_system_utils.dart';

class MyPokemonsViewModel extends ChangeNotifier {
  List<PokemonCapturesModel> _pokemonsCaptures = [];
  bool _loadingPokemonsCaptures = false;

  MyPokemonsViewModel(){
    loadingPokemonsCaptures = true;
    notifyListeners();
    loadPokemonsCaptures();
  }

  void loadPokemonsCaptures() async {
    try {
      List<String> pokemonsDirs = await FileSystemUtils.listExternalDirectory();
      for (var i = 0; i < pokemonsDirs.length; i++) {
        String pokemonFolderName = basename(pokemonsDirs[i]);
        if (!pokemonFolderName.contains('pokemon_')) return;
        String pokemonId = pokemonFolderName.split('_')[1];
        Pokemon pokemon = await PokemonServices.getPokemon(pokemonId);
        List<String> pokemonsCapturePaths = await FileSystemUtils.listExternalFolder(pokemonFolderName);
        _pokemonsCaptures.add(
          PokemonCapturesModel(
            pokemon: pokemon,
            captures: pokemonsCapturePaths
          )
        );
      }
    } catch (e) {}
    loadingPokemonsCaptures = false;
    notifyListeners();
  }

  List<PokemonCapturesModel> get pokemonsCaptures => _pokemonsCaptures;

  set pokemonsCaptures(List<PokemonCapturesModel> newPokemonsCaptures) {
    _pokemonsCaptures = newPokemonsCaptures;
  }


  bool get loadingPokemonsCaptures => _loadingPokemonsCaptures;

  set loadingPokemonsCaptures(bool newLoadingPokemonsCaptures) {
    _loadingPokemonsCaptures = newLoadingPokemonsCaptures;
  }

}