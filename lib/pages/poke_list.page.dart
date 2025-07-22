import 'package:flutter/material.dart';
import 'package:pokememory/utils/const_desing.dart';

class PokeList extends StatefulWidget {
  const PokeList({super.key});

  @override
  State<PokeList> createState() => _PokeListState();
}

class _PokeListState extends State<PokeList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Stack(
          children: [
            Text(
              "Pokédex",
              style: TextStyle(
                fontFamily: $fontPokemon,
                foreground:
                    Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 2
                      ..color = $colorPokemonSecondary,
              ),
            ),
            Text(
              "Pokédex",
              style: TextStyle(fontFamily: $fontPokemon, color: $colorPokemon),
            ),
          ],
        ),
      ),
    );
  }
}
