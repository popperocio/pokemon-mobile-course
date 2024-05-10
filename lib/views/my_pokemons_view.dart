import 'package:flutter/material.dart';
import 'package:pokemon_mobile_course/view_model/my_pokemons_view_model.dart';
import 'package:pokemon_mobile_course/widgets/my_pokemons_view_body.dart';
import 'package:provider/provider.dart';

class MyPokemonsView extends StatefulWidget {
  const MyPokemonsView({super.key});

  @override
  State<MyPokemonsView> createState() => _MyPokemonsViewState();
}

class _MyPokemonsViewState extends State<MyPokemonsView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Pokemons'),
      ),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => MyPokemonsViewModel(),
          ),
        ],
        child: const MyPokemonsViewBody()
      ),
    );
  }
}