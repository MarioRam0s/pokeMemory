import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokememory/data/datasources/pokemons.datasource.dart';
import 'package:pokememory/data/datasources/pokemons.datasource_impl.dart';
import 'package:pokememory/data/repositories/pokemons.repository_impl.dart';
import 'package:pokememory/domain/repositories/pokemons.repository.dart';
import 'package:pokememory/domain/usecases/pokemons.usecase.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio(BaseOptions(baseUrl: 'https://pokeapi.co/api/v2'));
});

final pokemonsDatasourceProvider = Provider<PokemonsDatasource>((ref) {
  return PokemonsDatasourceImpl(dio: ref.read(dioProvider));
});
final pokemonsRepositoryProvider = Provider<PokemonsRepository>((ref) {
  return PokemonsRepositoryImpl(
    datasource: ref.read(pokemonsDatasourceProvider),
  );
});

final pokemonsUseCaseProvider = Provider<PokemonsUseCase>((ref) {
  return PokemonsUseCase(ref.read(pokemonsRepositoryProvider));
});
