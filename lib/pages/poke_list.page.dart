import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokememory/pages/details_pokemon/details_pokemon.page.dart';
import 'package:pokememory/utils/const_desing.dart';

class PokeListPage extends StatefulWidget {
  const PokeListPage({super.key});

  @override
  State<PokeListPage> createState() => _PokeListPageState();
}

class _PokeListPageState extends State<PokeListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Stack(
              children: [
                Text(
                  "Pokédex",
                  style: TextStyle(
                    fontSize: 30,
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
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: $fontPokemon,
                    color: $colorPokemon,
                  ),
                ),
              ],
            ),
            SizedBox(width: 25),
            Expanded(
              child: TextFormField(
                onTap: () {},
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                  hintText: 'Buscar por nombre',
                  isDense: true,
                  fillColor: $white,
                  filled: true,
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: $colorPrimary,
      body: Container(
        decoration: BoxDecoration(
          color: $colorSecondary,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(10),
        height: double.infinity,
        width: double.infinity,

        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: 52,

          itemBuilder: (context, index) {
            return CardPokemon();
          },
        ),
      ),
      floatingActionButton: SpeedDial(
        backgroundColor: $colorPrimary,
        spaceBetweenChildren: 20,
        overlayColor: $black,
        children: [
          SpeedDialChild(
            child: SvgPicture.asset(
              height: 25,
              width: 25,
              fit: BoxFit.contain,
              $iconPokeball,
              colorFilter: ColorFilter.mode($colorPrimary, BlendMode.srcIn),
            ),
            label: 'All',
            labelStyle: TextStyle(
              color: $colorPrimary,
              fontWeight: FontWeight.bold,
            ),
            shape: CircleBorder(),
          ),
          SpeedDialChild(
            child: Icon(Icons.favorite, color: $colorPrimary),
            label: 'Favorite',
            labelStyle: TextStyle(
              color: $colorPrimary,
              fontWeight: FontWeight.bold,
            ),
            shape: CircleBorder(),
          ),
          SpeedDialChild(
            child: Icon(Icons.filter_alt, color: $colorPrimary),
            label: 'Generations',
            labelStyle: TextStyle(
              color: $colorPrimary,
              fontWeight: FontWeight.bold,
            ),
            shape: CircleBorder(),
          ),
        ],
        elevation: 30,
        activeIcon: Icons.clear,
        foregroundColor: $white,
        icon: Icons.add,
      ),
    );
  }
}

class CardPokemon extends StatelessWidget {
  const CardPokemon({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const DetailsPokemonPage(),
          ),
        );
      },
      child: Container(
        height: 105,
        width: 105,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: $colorPsychic,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: $white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  padding: EdgeInsets.all(1),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        height: 10,
                        width: 10,
                        fit: BoxFit.contain,
                        $iconBug,
                      ),
                      SizedBox(width: 2),
                      SvgPicture.asset(
                        height: 10,
                        width: 10,
                        fit: BoxFit.contain,
                        $iconFire,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Text('#0151', style: TextStyle(color: $white)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 3),
            Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  height: 50,
                  width: 50,
                  fit: BoxFit.contain,
                  $backgroundPokeball,
                ),
                Image.asset(
                  height: 60,
                  width: 60,
                  fit: BoxFit.contain,
                  $loading,
                ),
              ],
            ),
            Text('Mew'),
          ],
        ),
      ),
    );
  }
}
