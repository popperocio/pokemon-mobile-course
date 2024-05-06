import 'package:pokemon_mobile_course/model/pokemon_model.dart';

class PokemonCapturesModel {
  Pokemon _pokemon;
  List<String> _captures;

  PokemonCapturesModel({
    required Pokemon pokemon,
    List<String> captures = const [],
  }) :
    _captures = captures,
    _pokemon = pokemon;

  Pokemon get pokemon => _pokemon;

  set pokemon(Pokemon newPokemon){
    _pokemon = newPokemon;
  }


  List<String> get captures => _captures;

  set captures(List<String> newCaptures){
    _captures = newCaptures;
  }


  void addCapture(String pathCapture) => _captures.add(pathCapture);

}