import 'package:flutter/material.dart';

class MyPokemonsButton extends StatelessWidget {
  final Function() onTap;

  const MyPokemonsButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 200,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: BorderRadius.circular(5),
        ),
        child: const Center(
          child: Text(
            'My pokemons',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}