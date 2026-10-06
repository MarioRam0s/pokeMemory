import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pokememory/domain/entities/pokemon_list.entitiy.dart';
import 'package:pokememory/l10n/app_localizations.dart';
import 'package:pokememory/providers/filters.provider.dart';
import 'package:pokememory/providers/pokemon_list.provider.dart';
import 'package:pokememory/shared/drawer.dart';
import 'package:pokememory/utils/const_desing.dart';

class PokeListPage extends ConsumerStatefulWidget {
  const PokeListPage({super.key});

  @override
  ConsumerState<PokeListPage> createState() => _PokeListPageState();
}

class _PokeListPageState extends ConsumerState<PokeListPage> {
  static Map<String, List<String>> pokemonTypes = {};

  static Map<String, List<String>> pokemonGenerations = {};

  final ScrollController _scrollController = ScrollController();
  bool isSelected = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      final pokemonState = ref.read(pokemonListProvider);
      if (pokemonState.isLoading == false) {
        if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 250) {
          ref.read(pokemonListProvider.notifier).loadMorePokemons();
        }
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final intL = AppLocalizations.of(context)!;

    pokemonTypes = {
      'bug': [intL.bug, $iconBug],
      'dark': [intL.dark, $iconDark],
      'dragon': [intL.dragon, $iconDragon],
      'electric': [intL.electric, $iconElecric],
      'fairy': [intL.fairy, $iconFairy],
      'fighting': [intL.fighting, $iconFighting],
      'fire': [intL.fire, $iconFire],
      'flying': [intL.flying, $iconFlying],
      'ghost': [intL.ghost, $iconGhost],
      'grass': [intL.grass, $iconGrass],
      'ground': [intL.ground, $iconGround],
      'ice': [intL.ice, $iconIce],
      'normal': [intL.normal, $iconNormal],
      'poison': [intL.poison, $iconPoison],
      'psychic': [intL.psychic, $iconPsychic],
      'rock': [intL.rock, $iconRock],
      'steel': [intL.steel, $iconSteel],
      'water': [intL.water, $iconWater],
    };

    pokemonGenerations = {
      'first': [intL.first, $firstGeneration],
      'second': [intL.second, $secondGeneration],
      'third': [intL.third, $thirdGeneration],
      'fourth': [intL.fourth, $fourthGeneration],
      'fifth': [intL.fifth, $fifthGeneration],
      'sixth': [intL.sixth, $sixthGeneration],
      'seventh': [intL.seventh, $seventhGeneration],
      'eighth': [intL.eighth, $eighthGeneration],
      'ninth': [intL.ninth, $ninthGeneration],
    };
  }

  @override
  Widget build(BuildContext context) {
    final pokemonState = ref.watch(pokemonListProvider);
    final isLoading = ref.watch(loading);
    final intL = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70,
        leading: Builder(
          builder: (context) {
            return Container(
              width: 60,
              margin: EdgeInsets.only(left: 15),
              child: IconButton(
                icon: Transform.rotate(
                  angle: 160 * pi / 180,
                  child: Icon(
                    Icons.catching_pokemon,
                    color: $white,
                    size: 36,
                    grade: 90,
                  ),
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            );
          },
        ),
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
                  hintText: intL.findNameId,
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
        child: pokemonState.when(
          loading: () {
            return null;
          },
          error: (error, stackTrace) {
            return Center(child: Text('Error: $error'));
          },

          data: (data) {
            return Stack(
              children: [
                GridView.builder(
                  controller: _scrollController,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final pokemon = data[index];
                    return CardPokemon(pokemon: pokemon);
                  },
                ),
                if (isLoading) ...[
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: $black.withValues(alpha: 0.5),
                      width: double.infinity,
                      height: 60,
                      child: Center(
                        child: CircularProgressIndicator(color: $colorPrimary),
                      ),
                    ),
                  ),
                ],
              ],
            );
          },
        ),
      ),
      floatingActionButton: SpeedDial(
        backgroundColor: $colorPrimary,
        spaceBetweenChildren: 20,
        overlayColor: $black,

        children: [
          SpeedDialChild(
            child: Icon(Icons.pets, color: $colorPrimary),
            label: intL.all,
            labelStyle: TextStyle(
              color: $colorPrimary,
              fontWeight: FontWeight.bold,
            ),
            shape: CircleBorder(),
          ),
          SpeedDialChild(
            child: Icon(Icons.sell, color: $colorPrimary),
            label: intL.types,
            labelStyle: TextStyle(
              color: $colorPrimary,
              fontWeight: FontWeight.bold,
            ),
            shape: CircleBorder(),
            onTap: () async {
              final Map<String, bool> typesFilter = Map<String, bool>.from(
                ref.read(filterProvider).value!.types,
              );

              final closed = await showModalBottomSheet(
                context: context,
                builder: (context) {
                  return StatefulBuilder(
                    builder: (context, setState) {
                      return SizedBox(
                        height: 350,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Text(
                                intL.types,
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w900,
                                  color: $colorPrimary,
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: pokemonTypes.length,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 20,
                                ),
                                itemBuilder: (context, index) {
                                  return Row(
                                    children: [
                                      Expanded(
                                        child: ListTile(
                                          leading: SvgPicture.asset(
                                            height: 35,
                                            width: 35,
                                            fit: BoxFit.contain,
                                            pokemonTypes.values
                                                .toList()[index][1],
                                          ),
                                          title: Text(
                                            pokemonTypes.values
                                                .toList()[index][0],
                                          ),
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ),
                                      Checkbox(
                                        activeColor: $colorPrimary,
                                        side: BorderSide(
                                          width: 2,
                                          color: $colorPrimary,
                                        ),
                                        value:
                                            typesFilter.values.toList()[index],
                                        onChanged:
                                            (value) => {
                                              setState(() {
                                                typesFilter[typesFilter.keys
                                                        .toList()[index]] =
                                                    value!;
                                              }),
                                            },
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              );

              if (closed == null &&
                  !mapEquals(
                    typesFilter,
                    ref.read(filterProvider).value!.types,
                  )) {
                ref.read(filterProvider.notifier).updateTypes(typesFilter);
              }
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.favorite, color: $colorPrimary),
            label: intL.favorites,
            labelStyle: TextStyle(
              color: $colorPrimary,
              fontWeight: FontWeight.bold,
            ),
            shape: CircleBorder(),
          ),

          SpeedDialChild(
            child: Icon(Icons.catching_pokemon, color: $colorPrimary),
            label: intL.generations,
            labelStyle: TextStyle(
              color: $colorPrimary,
              fontWeight: FontWeight.bold,
            ),
            shape: CircleBorder(),

            onTap: () async {
              final Map<String, bool> currentGenerations =
                  Map<String, bool>.from(
                    ref.read(filterProvider).value!.generation,
                  );

              final isClosed = await showModalBottomSheet(
                context: context,

                builder: (context) {
                  return StatefulBuilder(
                    builder: (context, setState) {
                      return SizedBox(
                        height: 350,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Text(
                                intL.generations,
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w900,
                                  color: $colorPrimary,
                                ),
                              ),
                            ),

                            Expanded(
                              child: GridView.builder(
                                shrinkWrap: true,
                                itemCount: currentGenerations.keys.length,
                                padding: EdgeInsets.only(
                                  left: 30,
                                  right: 30,
                                  bottom: 20,
                                ),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 1.5,
                                      crossAxisSpacing: 10,
                                    ),
                                itemBuilder: (context, index) {
                                  return Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      Container(
                                        height: 50,
                                        padding: EdgeInsets.only(
                                          left: 22,
                                          right: 10,
                                        ),
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: $colorPrimary,
                                          borderRadius: BorderRadius.circular(
                                            50,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                pokemonGenerations.values
                                                    .toList()[index][0],
                                                style: TextStyle(
                                                  color: $white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Checkbox(
                                              value:
                                                  currentGenerations.values
                                                      .toList()[index],
                                              activeColor: $white,
                                              checkColor: $colorPrimary,
                                              side: BorderSide(
                                                color: $white,
                                                width: 2,
                                              ),
                                              onChanged: (value) {
                                                setState(() {
                                                  currentGenerations[currentGenerations
                                                          .keys
                                                          .toList()[index]] =
                                                      value!;
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(bottom: 37),
                                        child: Image.asset(
                                          fit: BoxFit.contain,
                                          pokemonGenerations.values
                                              .toList()[index][1],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              );

              if (isClosed == null &&
                  !mapEquals(
                    currentGenerations,
                    ref.read(filterProvider).value!.generation,
                  )) {
                ref
                    .read(filterProvider.notifier)
                    .updateGenerations(currentGenerations);
              }
            },
          ),
        ],
        elevation: 30,
        activeIcon: Icons.clear,
        foregroundColor: $white,
        icon: Icons.add,
      ),
      drawer: DrawerShared(),
    );
  }
}

class CardPokemon extends ConsumerStatefulWidget {
  final PokemonEntity pokemon;

  const CardPokemon({super.key, required this.pokemon});

  @override
  ConsumerState<CardPokemon> createState() => _CardPokemonState();
}

class _CardPokemonState extends ConsumerState<CardPokemon> {
  static Map<String, Color> pokemonTypeColors = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final intL = AppLocalizations.of(context)!;

    pokemonTypeColors = {
      intL.normal: $colorNormal,
      intL.fire: $colorFire,
      intL.water: $colorWater,
      intL.grass: $colorGrass,
      intL.electric: $colorElectric,
      intL.ice: $colorIce,
      intL.fighting: $colorFighting,
      intL.poison: $colorPoison,
      intL.ground: $colorGround,
      intL.flying: $colorFlying,
      intL.psychic: $colorPsychic,
      intL.bug: $colorBug,
      intL.rock: $colorRock,
      intL.ghost: $colorGhost,
      intL.dragon: $colorDragon,
      intL.dark: $colorDark,
      intL.steel: $colorSteel,
      intL.fairy: $colorFairy,
    };
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed('details-pokemon', pathParameters: {'id': '4'});
      },
      child: Container(
        height: 105,
        width: 105,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color:
              Color.lerp(
                pokemonTypeColors[widget.pokemon.types[0].type.name[0]
                        .toUpperCase() +
                    widget.pokemon.types[0].type.name.substring(1)]!,
                Colors.white,
                0.2,
              )!,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    spacing: 2,
                    children:
                        widget.pokemon.types
                            .map(
                              (type) => SvgPicture.asset(
                                height: 20,
                                width: 20,
                                fit: BoxFit.contain,
                                'assets/img/icons_pokemon/${type.type.name}.svg',
                              ),
                            )
                            .toList(),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '#${widget.pokemon.id.toString().padLeft(4, '0')}',
                      style: TextStyle(
                        color: $white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Transform.rotate(
                  angle: 160 * pi / 180,
                  child: Icon(
                    Icons.catching_pokemon_rounded,
                    size: 80,
                    color: $white.withValues(alpha: 0.15),
                  ),
                ),
                Image.network(
                  height: 60,
                  width: 60,
                  fit: BoxFit.contain,
                  loadingBuilder: (context, child, loadingProgress) {
                    return loadingProgress == null
                        ? child
                        : Image.asset(
                          height: 60,
                          width: 60,
                          fit: BoxFit.contain,
                          $loading,
                        );
                  },
                  widget.pokemon.image ?? $placeholder,
                ),
              ],
            ),
            Text(
              widget.pokemon.name[0].toUpperCase() +
                  widget.pokemon.name.substring(1),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
