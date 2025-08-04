import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokememory/shared/shimmer.dart';
import 'package:pokememory/utils/const_desing.dart';
import 'package:shimmer/shimmer.dart';

class DetailsPokemonPage extends StatefulWidget {
  const DetailsPokemonPage({super.key});

  @override
  State<DetailsPokemonPage> createState() => _DetailsPokemonPageState();
}

class _DetailsPokemonPageState extends State<DetailsPokemonPage>
    with SingleTickerProviderStateMixin {
  final Color orange = $colorGhost;
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: orange,
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            alignment: Alignment.topRight,
            child: SvgPicture.asset(
              $backgroundPokeball,
              height: 225,
              width: 225,
            ),
          ),
          Scaffold(
            backgroundColor: $transparent,
            appBar: AppBar(
              backgroundColor: $transparent,
              foregroundColor: $white,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Gengar', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('#0094', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            body: Container(
              padding: EdgeInsets.only(right: 10, left: 10, bottom: 5),
              child: Column(
                children: [
                  Container(
                    height: 35,
                    alignment: Alignment.centerRight,
                    child: Chip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      label: Text(
                        'Mystic',
                        style: TextStyle(color: $colorGhost),
                      ),
                      backgroundColor: $colorSecondary,
                    ),
                  ),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        height: 50,
                        decoration: BoxDecoration(
                          color: $colorSecondary,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.favorite),
                          iconSize: 35,
                          color: $white,
                        ),
                      ),
                      SizedBox(
                        height: 220,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {},
                              iconSize: 40,
                              icon: Icon(Icons.arrow_left, color: $white),
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  width: 200,
                                  height: 200,
                                  fit: BoxFit.contain,
                                  $load,
                                ),
                                Shimmer.fromColors(
                                  baseColor: $colorBaseShimmer,
                                  highlightColor: $highlightColorShimmer,
                                  child: Text(
                                    '... Consultando datos de la pokedex',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            IconButton(
                              onPressed: () {},
                              iconSize: 40,
                              icon: Icon(Icons.arrow_right, color: $white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  TabBars(controller: _controller),
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: TabBarView(
                        controller: _controller,
                        children: [
                          About(isload: true),
                          Kombat(isLoad: true),
                          Variants(isLoad: true),
                          Evolutions(isLoad: true),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Evolutions extends StatelessWidget {
  final bool isLoad;
  const Evolutions({super.key, required this.isLoad});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        color: $colorSecondary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child:
          isLoad
              ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    $loadingPokeball,
                    width: 200,
                    fit: BoxFit.contain,
                  ),
                  Container(
                    width: 75,
                    margin: EdgeInsets.all(20),
                    child: LinearProgressIndicator(
                      borderRadius: BorderRadius.circular(10),
                      color: $highlightColorShimmer,
                      backgroundColor: $colorBaseShimmer,
                    ),
                  ),
                ],
              )
              : SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Image.network(
                              width: 125,
                              height: 125,
                              'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/092.png',
                            ),
                            Text('Gatly'),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.arrow_right_alt, color: $white),
                            Text('Lvl 26'),
                          ],
                        ),
                        Column(
                          children: [
                            Image.network(
                              width: 125,
                              height: 125,
                              'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/093.png',
                            ),
                            Text('Hunter'),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Image.network(
                              width: 125,
                              height: 125,
                              'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/093.png',
                            ),
                            Text('Hunter'),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.arrow_right_alt, color: $white),
                            Text('Lvl 50'),
                          ],
                        ),
                        Column(
                          children: [
                            Image.network(
                              width: 125,
                              height: 125,
                              'https://archives.bulbagarden.net/media/upload/thumb/4/47/0094Gengar.png/640px-0094Gengar.png',
                            ),
                            Text('Gengar'),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Image.network(
                              width: 125,
                              height: 125,
                              'https://archives.bulbagarden.net/media/upload/thumb/4/47/0094Gengar.png/640px-0094Gengar.png',
                            ),
                            Text('Gengar'),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.arrow_right_alt, color: $white),
                            Text('Intercambio'),
                          ],
                        ),
                        Column(
                          children: [
                            Image.network(
                              width: 125,
                              height: 125,
                              'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/094_f2.png',
                            ),
                            Text('Mega gengar'),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
    );
  }
}

class Variants extends StatelessWidget {
  final bool isLoad;
  const Variants({super.key, required this.isLoad});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: $colorSecondary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child:
          isLoad
              ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    $loadingPokeball,
                    width: 200,
                    fit: BoxFit.contain,
                  ),
                  Container(
                    width: 75,
                    margin: EdgeInsets.all(20),
                    child: LinearProgressIndicator(
                      borderRadius: BorderRadius.circular(10),
                      color: $highlightColorShimmer,
                      backgroundColor: $colorBaseShimmer,
                    ),
                  ),
                ],
              )
              : GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      if (index < 2) SizedBox(height: 20),
                      Image.asset(width: 125, height: 125, $placeholder),
                      SizedBox(height: 5),
                      Text('Alola shiny'),
                    ],
                  );
                },
              ),
    );
  }
}

class Kombat extends StatelessWidget {
  final bool isLoad;
  const Kombat({super.key, required this.isLoad});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: $colorSecondary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: SingleChildScrollView(
        child:
            isLoad
                ? ShimmerKombat()
                : Column(
                  children: [
                    Container(
                      height: 35,
                      margin: EdgeInsets.only(top: 10, bottom: 20),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Chip(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              side: BorderSide(width: 0),
                            ),
                            color: WidgetStatePropertyAll($colorGhost),
                            label: Text(
                              'Ghost',
                              style: TextStyle(color: $white),
                            ),
                            backgroundColor: $colorSecondary,
                          ),
                          SizedBox(width: 10),
                          Chip(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              side: BorderSide(width: 0),
                            ),
                            color: WidgetStatePropertyAll($colorFairy),
                            label: Text(
                              'Fairy',
                              style: TextStyle(color: $white),
                            ),
                            backgroundColor: $colorSecondary,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Efectividad de tipos',
                      style: TextStyle(
                        color: $colorGhost,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Table(
                      children: [
                        TableRow(
                          children: [
                            TableCell(
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: $white),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: 30,
                                child: Text('Resistencia'),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: $white),
                                  ),
                                ),
                                margin: EdgeInsets.only(bottom: 10),
                                alignment: Alignment.center,
                                height: 30,
                                child: Text('Debilidad'),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCell(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(right: 10),
                                      alignment: Alignment.centerRight,
                                      child: Chip(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                          side: BorderSide(width: 0),
                                        ),
                                        color: WidgetStatePropertyAll(
                                          $colorGhost,
                                        ),
                                        avatar: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: $white,
                                              width: 0.5,
                                            ),
                                          ),
                                          child: CircleAvatar(
                                            child: SvgPicture.asset(
                                              $iconGhost,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                        label: Text(
                                          'Ghost',
                                          style: TextStyle(color: $white),
                                        ),
                                        backgroundColor: $colorSecondary,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 50,
                                    alignment: Alignment.centerLeft,
                                    child: Text('x1'),
                                  ),
                                ],
                              ),
                            ),
                            TableCell(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(right: 10),
                                      alignment: Alignment.centerRight,
                                      child: Chip(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                          side: BorderSide(width: 0),
                                        ),
                                        color: WidgetStatePropertyAll(
                                          $colorDragon,
                                        ),
                                        avatar: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: $white,
                                              width: 0.5,
                                            ),
                                          ),
                                          child: CircleAvatar(
                                            child: SvgPicture.asset(
                                              $iconDragon,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                        label: Text(
                                          'Dragon',
                                          style: TextStyle(color: $white),
                                        ),
                                        backgroundColor: $colorSecondary,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 50,
                                    alignment: Alignment.centerLeft,
                                    child: Text('x4'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCell(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(right: 10),
                                      alignment: Alignment.centerRight,
                                      child: Chip(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                          side: BorderSide(width: 0),
                                        ),
                                        color: WidgetStatePropertyAll(
                                          $colorIce,
                                        ),
                                        avatar: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: $white,
                                              width: 0.5,
                                            ),
                                          ),
                                          child: CircleAvatar(
                                            child: SvgPicture.asset(
                                              $iconIce,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                        label: Text(
                                          'Ice',
                                          style: TextStyle(color: $white),
                                        ),
                                        backgroundColor: $colorSecondary,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 50,
                                    alignment: Alignment.centerLeft,
                                    child: Text('x2'),
                                  ),
                                ],
                              ),
                            ),
                            TableCell(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(right: 10),
                                      alignment: Alignment.centerRight,
                                      child: Chip(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                          side: BorderSide(width: 0),
                                        ),
                                        color: WidgetStatePropertyAll(
                                          $colorGrass,
                                        ),
                                        avatar: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: $white,
                                              width: 0.5,
                                            ),
                                          ),
                                          child: CircleAvatar(
                                            child: SvgPicture.asset(
                                              $iconGrass,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                        label: Text(
                                          'Grass',
                                          style: TextStyle(color: $white),
                                        ),
                                        backgroundColor: $colorSecondary,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 50,
                                    alignment: Alignment.centerLeft,
                                    child: Text('x4'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCell(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(right: 10),
                                      alignment: Alignment.centerRight,
                                      child: Chip(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                          side: BorderSide(width: 0),
                                        ),
                                        color: WidgetStatePropertyAll(
                                          $colorFighting,
                                        ),
                                        avatar: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: $white,
                                              width: 0.5,
                                            ),
                                          ),
                                          child: CircleAvatar(
                                            child: SvgPicture.asset(
                                              $iconDark,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                        label: Text(
                                          'Fighting',
                                          style: TextStyle(color: $white),
                                        ),
                                        backgroundColor: $colorSecondary,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 50,
                                    alignment: Alignment.centerLeft,
                                    child: Text('x3'),
                                  ),
                                ],
                              ),
                            ),
                            TableCell(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(right: 10),
                                      alignment: Alignment.centerRight,
                                      child: Chip(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                          side: BorderSide(width: 0),
                                        ),
                                        color: WidgetStatePropertyAll(
                                          $colorElectric,
                                        ),
                                        avatar: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: $white,
                                              width: 0.5,
                                            ),
                                          ),
                                          child: CircleAvatar(
                                            child: SvgPicture.asset(
                                              $iconElecric,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                        label: Text(
                                          'Electric',
                                          style: TextStyle(color: $white),
                                        ),
                                        backgroundColor: $colorSecondary,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 50,
                                    alignment: Alignment.centerLeft,
                                    child: Text('x2'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Moves',
                      style: TextStyle(
                        color: $colorGhost,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Table(
                      children: [
                        TableRow(
                          children: [
                            TableCell(
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: $white),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: 30,
                                child: Text('Name'),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: $white),
                                  ),
                                ),
                                margin: EdgeInsets.only(bottom: 10),
                                alignment: Alignment.center,
                                height: 30,
                                child: Text('PP'),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: $white),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: 30,
                                child: Text('Power'),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: $white),
                                  ),
                                ),
                                margin: EdgeInsets.only(bottom: 10),
                                alignment: Alignment.center,
                                height: 30,
                                child: Text('Acurracy'),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCell(
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                alignment: Alignment.center,
                                height: 30,
                                child: Text('Tacleada'),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                alignment: Alignment.center,
                                height: 30,
                                child: Text('20'),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                alignment: Alignment.center,
                                height: 30,
                                child: Text('40'),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                alignment: Alignment.center,
                                height: 30,
                                child: Text('100'),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCell(
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                alignment: Alignment.center,
                                height: 30,
                                child: Text('Tacleada'),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                alignment: Alignment.center,
                                height: 30,
                                child: Text('20'),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                alignment: Alignment.center,
                                height: 30,
                                child: Text('40'),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                alignment: Alignment.center,
                                height: 30,
                                child: Text('100'),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCell(
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                alignment: Alignment.center,
                                height: 30,
                                child: Text('Tacleada'),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                alignment: Alignment.center,
                                height: 30,
                                child: Text('20'),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                alignment: Alignment.center,
                                height: 30,
                                child: Text('40'),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                alignment: Alignment.center,
                                height: 30,
                                child: Text('100'),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCell(
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                alignment: Alignment.center,
                                height: 30,
                                child: Text('Tacleada'),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                alignment: Alignment.center,
                                height: 30,
                                child: Text('20'),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                alignment: Alignment.center,
                                height: 30,
                                child: Text('40'),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                alignment: Alignment.center,
                                height: 30,
                                child: Text('100'),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCell(
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                alignment: Alignment.center,
                                height: 30,
                                child: Text('Tacleada'),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                alignment: Alignment.center,
                                height: 30,
                                child: Text('20'),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                alignment: Alignment.center,
                                height: 30,
                                child: Text('40'),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                alignment: Alignment.center,
                                height: 30,
                                child: Text('100'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
      ),
    );
  }
}

class ShimmerKombat extends StatelessWidget {
  const ShimmerKombat({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30),
        ...List.generate(3, (index) {
          return ShimmerShared();
        }),
        ...List.generate(3, (index) {
          return Row(
            children: [
              Expanded(child: ShimmerShared()),
              SizedBox(width: 10),
              Expanded(child: ShimmerShared()),
            ],
          );
        }),
        ShimmerShared(),
        ...List.generate(4, (index) {
          return Row(
            children: [
              Expanded(child: ShimmerShared()),
              SizedBox(width: 10),
              Expanded(child: ShimmerShared()),
            ],
          );
        }),
      ],
    );
  }
}

class About extends StatelessWidget {
  final bool isload;
  const About({super.key, required this.isload});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: $colorSecondary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child:
          isload
              ? SingleChildScrollView(child: ShimmerAbout())
              : Column(
                children: [
                  Container(
                    height: 35,
                    margin: EdgeInsets.only(top: 10),
                    alignment: Alignment.center,
                    child: Chip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        side: BorderSide(width: 0),
                      ),
                      color: WidgetStatePropertyAll($colorGhost),
                      label: Text('Ghost', style: TextStyle(color: $white)),
                      backgroundColor: $colorSecondary,
                    ),
                  ),

                  Container(
                    height: 60,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.balance, color: $white),
                                SizedBox(width: 15),
                                Text('8,5 kg'),
                              ],
                            ),
                            Text('Weight'),
                          ],
                        ),
                        VerticalDivider(color: $white, width: 10, thickness: 2),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Transform.rotate(
                                  angle: 90 * 3.14 / 180,
                                  child: Icon(Icons.straighten, color: $white),
                                ),
                                SizedBox(width: 15),
                                Text('0.6 m'),
                              ],
                            ),
                            Text('Height'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Gengar, a ghost/poison-type Pokémon, possesses the ability to levitate, disappear and reappear at will, and hide in shadows.',
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Base Stats',
                    style: TextStyle(
                      color: $colorGhost,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 20,
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.centerRight,
                          width: 25,
                          child: Text('HP'),
                        ),
                        VerticalDivider(color: $white),
                        Text('087'),
                        SizedBox(width: 10),
                        Expanded(
                          child: LinearProgressIndicator(
                            color: $colorGhost,
                            value: 0.8,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.centerRight,
                          width: 25,
                          child: Text('ATK'),
                        ),
                        VerticalDivider(color: $white),
                        Text('052'),
                        SizedBox(width: 10),
                        Expanded(
                          child: LinearProgressIndicator(
                            color: $colorGhost,
                            value: 0.52,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.centerRight,
                          width: 25,
                          child: Text('DEF'),
                        ),
                        VerticalDivider(color: $white),
                        Text('043'),
                        SizedBox(width: 10),
                        Expanded(
                          child: LinearProgressIndicator(
                            color: $colorGhost,
                            value: 0.43,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.centerRight,
                          width: 25,
                          child: Text('SATK'),
                        ),
                        VerticalDivider(color: $white),
                        Text('060'),
                        SizedBox(width: 10),
                        Expanded(
                          child: LinearProgressIndicator(
                            color: $colorGhost,
                            value: 0.6,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.centerRight,
                          width: 25,
                          child: Text('SDEF'),
                        ),
                        VerticalDivider(color: $white),
                        Text('050'),
                        SizedBox(width: 10),
                        Expanded(
                          child: LinearProgressIndicator(
                            color: $colorGhost,
                            value: 0.5,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.centerRight,
                          width: 25,
                          child: Text('SDP'),
                        ),
                        VerticalDivider(color: $white),
                        Text('065'),
                        SizedBox(width: 10),
                        Expanded(
                          child: LinearProgressIndicator(
                            color: $colorGhost,
                            value: 0.65,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
    );
  }
}

class ShimmerAbout extends StatelessWidget {
  const ShimmerAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30),
        ShimmerShared(),
        Row(
          children: [
            Expanded(child: ShimmerShared(width: 50)),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 15,
              child: VerticalDivider(color: $white, width: 10, thickness: 2),
            ),
            Expanded(child: ShimmerShared()),
          ],
        ),
        ...List.generate(3, (index) {
          return ShimmerShared();
        }),
        ...List.generate(3, (index) {
          return Row(
            children: [
              ShimmerShared(width: 50),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 15,
                child: VerticalDivider(color: $white, width: 10, thickness: 2),
              ),
              Expanded(child: ShimmerShared()),
            ],
          );
        }),
      ],
    );
  }
}

class TabBars extends StatefulWidget {
  final TabController controller;
  const TabBars({super.key, required this.controller});

  @override
  State<TabBars> createState() => _TabBarsState();
}

class _TabBarsState extends State<TabBars> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,

      child: Container(
        width: double.infinity,
        height: 50,
        color: $colorSecondary,
        child: TabBar(
          labelColor: $colorGhost,
          dividerColor: $colorSecondary,
          indicatorColor: $colorGhost,
          unselectedLabelColor: $white,
          controller: widget.controller,
          tabs: [
            Text('About', overflow: TextOverflow.ellipsis),
            Text('Kombat', overflow: TextOverflow.ellipsis),
            Text('Variants', overflow: TextOverflow.ellipsis),
            Text('Evolutions', overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }
}
