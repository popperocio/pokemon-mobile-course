import 'package:http/http.dart' as http;
import 'package:pokemon_mobile_course/model/pokemon_model.dart';

class PokemonServices {
  static Future<Pokemon> getPokemon(id) async {
    final urlUri = Uri.parse('https://pokeapi.co/api/v2/pokemon/$id');
    final response = await http.get(urlUri);
    final pokemon = Pokemon.fromJson(response.body);
    return pokemon;
  }
}
