import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokememory/pages/details_pokemon/details_pokemon.page.dart';
import 'package:pokememory/pages/poke_list.page.dart';

final scaffoldKey = GlobalKey<ScaffoldState>();
final GoRouter appRouter = GoRouter(
  initialLocation: "/list-pokemons",
  routes: [
    GoRoute(
      path: "/list-pokemons",
      name: "list-pokemons",
      pageBuilder:
          (context, state) =>
              MaterialPage<void>(key: state.pageKey, child: PokeListPage()),
      routes: [
        GoRoute(
          path: "/list-pokemons/:id",
          name: 'details-pokemon',
          pageBuilder:
              (context, state) =>
                  MaterialPage(key: state.pageKey, child: DetailsPokemonPage()),
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) {
    return Scaffold(
      body: Center(child: Text('Ruta no encontrada: ${state.uri.path}')),
    );
  },
);
